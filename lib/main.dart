import 'package:calendar/screen/add_event/add_event_screen.dart';
import 'package:calendar/screen/calendar/calendar_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black)
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/',
      routes: {
        CalendarScreen.routeName: (context) => const CalendarScreen(),
        AddEventScreen.routeName: (context) => const AddEventScreen()
      },
    );
  }
}

