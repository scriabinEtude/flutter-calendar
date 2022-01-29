import 'package:calendar/model/event.dart';
import 'package:calendar/screen/add_event/add_event_screen.dart';
import 'package:calendar/screen/add_event/add_event_screen_arguments.dart';
import 'package:flutter/material.dart';

Future calendarDetailBottomSheet(BuildContext context, List<Event> events, DateTime selectedDay) async {
  showModalBottomSheet<dynamic>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      isScrollControlled: true,
      builder: (context){
        return Container(
          height: MediaQuery.of(context).size.height * 0.95,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalendarDetailItems(events: events, selectedDay: selectedDay,),
              AddEventButton(selectedDay: selectedDay)
            ],
          ),
        );
      },
  );
}

class CalendarDetailItems extends StatelessWidget {
  const CalendarDetailItems({
    Key? key,
    required this.events,
    required this.selectedDay
  }) : super(key: key);

  final List<Event> events;
  final DateTime selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: events.map((e){

        const subTextStyle = TextStyle(
            fontWeight: FontWeight.w300
        );

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(
              context,
              AddEventScreen.routeName,
              arguments: AddEventScreenArguments(
                selectedDay: selectedDay,
                event: e
              )
            );
          },
          child: Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            child: Row(
              children: [
                Container(
                  color: Color(e.color),
                  width: 3,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title, overflow: TextOverflow.ellipsis,),
                      Row(
                        children: [
                          Row(
                              children: [
                                const Icon(Icons.timer, size: 14, color: Colors.black54,),
                                e.is_all_day
                                    ? const Text('  all day', style: subTextStyle,)
                                    : Text('  ${e.start!.substring(0,2)}:${e.start!.substring(2)} ~ ${e.end!.substring(0,2)}:${e.end!.substring(2)}', style: subTextStyle),
                              ]
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}


class AddEventButton extends StatelessWidget {
  final DateTime selectedDay;
  const AddEventButton({
    Key? key,
    required this.selectedDay
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        Navigator.pushNamed(
          context,
          AddEventScreen.routeName,
          arguments: AddEventScreenArguments(
            selectedDay: selectedDay
          )
        );
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 3),
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1
              )
            ]
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
