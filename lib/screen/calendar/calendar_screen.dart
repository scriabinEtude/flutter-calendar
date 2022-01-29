import 'dart:async';

import 'package:calendar/component/calendar_appbar.dart';
import 'package:calendar/model/event.dart';
import 'package:calendar/screen/calendar/calendar_event.dart';
import 'package:calendar/screen/calendar/calendar_state.dart';
import 'package:calendar/screen/calendar/calendar_ui_event.dart';
import 'package:calendar/screen/calendar/calendar_view_model.dart';
import 'package:calendar/screen/calendar/component/calendar_detail_bottom_sheet/calendar_detail_bottom_sheet.dart';
import 'package:calendar/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalendarViewModel>(
      create: (context) => CalendarViewModel(),
      child: const CalendarScreenScaffold()
    );
  }
}


class CalendarScreenScaffold extends StatefulWidget {
  const CalendarScreenScaffold({Key? key}) : super(key: key);
  @override
  State<CalendarScreenScaffold> createState() => _CalendarScreenScaffoldState();
}

class _CalendarScreenScaffoldState extends State<CalendarScreenScaffold> {

  late final PageController _pageController;
  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  // final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
  //   equals: isSameDay,
  //   hashCode: getHashCode,
  // );

  DateTime? _selectedDays = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  StreamSubscription<CalendarUiEvent>? _streamSubscription;
  CalendarViewModel? viewModel;
  List<Event> events = [];

  @override
  void initState() {
    super.initState();

    viewModel = context.read<CalendarViewModel>();

    /// state initialize
    viewModel!(const CalendarEvent.selectAllEvents());

    /// ui event listener
    _streamSubscription = viewModel!.calendarStream.listen((event) {
      event.when(
        loadFailed: (message) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
        ),
        refresh: () => setState(() {})
      );
    });


    // _selectedDays.add(_focusedDay.value);
    _selectedDays = _focusedDay.value;
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  bool get canClearSelection =>
      // _selectedDays.isNotEmpty ||
  _rangeStart != null || _rangeEnd != null;

  List<Event> _getEventsForDay(DateTime day) {
    return viewModel!.state.events.where((event) => event.date == DateFormat('yyyyMMdd').format(day)).toList();
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if(!isSameDay(selectedDay, _selectedDays)){
        _selectedDays = selectedDay;

        _focusedDay.value = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      }
    });

    // _selectedEvents.value = _getEventsForDays(_selectedDays);
    _selectedEvents.value = _getEventsForDay(_selectedDays ?? DateTime.now());

    /// bottom sheet contains event list
    calendarDetailBottomSheet(context, _selectedEvents.value, selectedDay);
  }

  Widget? Function(BuildContext context, DateTime day, DateTime selectedDay)? _defaultTheme(TextStyle? textStyle){
    return (BuildContext context, DateTime day, DateTime selectedDay) {
      return SizedBox.expand(
        child: Text(
          '${day.day}',
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      );
    };
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      // _selectedDays.clear();
      _selectedDays = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CalendarAppBar(title: 'Calendar',),
      body: Column(
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return _CalendarHeader(
                focusedDay: value,
                clearButtonVisible: canClearSelection,
                onTodayButtonTap: () {
                  setState(() => _focusedDay.value = DateTime.now());
                },
                onClearButtonTap: () {
                  setState(() {
                    _rangeStart = null;
                    _rangeEnd = null;
                    // _selectedDays.clear();
                    _selectedDays = DateTime.now();
                    _selectedEvents.value = [];
                  });
                },
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays == day, //_selectedDays.contains(day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            rowHeight: (screenHeight - 180) / 6,
            holidayPredicate: (day) {
              return day.weekday == 7;
            },
            onDayLongPressed: (day1, day2){},
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
            calendarBuilders: CalendarBuilders<Event>(
                outsideBuilder: _defaultTheme(const TextStyle(color : Colors.grey)),
                holidayBuilder: _defaultTheme(const TextStyle(color : Colors.red)),
                defaultBuilder: _defaultTheme(null),
                selectedBuilder: (context, day, selectedDay){
                  return Container(
                    decoration: BoxDecoration(
                      // color: Colors.black12,
                        border: Border.all(width: 1, color: Colors.grey)
                    ),
                    child: SizedBox.expand(
                      child: Text('${day.day}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                todayBuilder: (context, day, selectedDay){
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.black12
                    ),
                    child: SizedBox.expand(
                      child: Text('${day.day}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                markerBuilder: (context, day, events){
                  if(events.isEmpty){
                    return const SizedBox();
                  }
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: events.map((e){
                        return Text(e.title, style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 9
                        ),);
                      }).toList(),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}


class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          SizedBox(
            width: 70.0,
            child: Text(
              headerText,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, size: 17.0),
            visualDensity: VisualDensity.compact,
            onPressed: onTodayButtonTap,
          ),
          if (clearButtonVisible)
            IconButton(
              icon: const Icon(Icons.clear, size: 20.0),
              visualDensity: VisualDensity.compact,
              onPressed: onClearButtonTap,
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}