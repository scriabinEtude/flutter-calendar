// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:calendar/model/event.dart';
import 'package:calendar/model/result.dart';
import 'package:calendar/repository/event_repository.dart';
import 'package:calendar/repository/impl/event_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  testWidgets("test", (WidgetTester tester) async {
    print(Colors.amber.value);
    print(Colors.black.value);
    print(Colors.white.value);
  });

  test('date', (){

    print(DateTime.now()..add(const Duration(hours: -10)));
    print(DateFormat('yyyyMMdd').format(DateTime.now()));
    print(DateFormat('HHmm').format(DateTime.now()..add(const Duration(hours: -10))));

    String date = "20220118";
    DateTime result = DateTime.parse(date);
    print(result);

    String time = "20220118 112800";
    DateTime timeResult = DateTime.parse(time);
    print(timeResult);
  });
  
  test('api', ()async{
    final EventRepository repository = EventRepositoryImpl();
    var response = await repository.insert(Event(
      date: '20220115',
      title: 'all day test',
      is_all_day: true
    ));
    expect(response is Success, true);
  });

  test("dio", () async {

    // Dio()
    //     .get(
    //       'https://jsonplaceholder.typicode.com/posts/1',
    //       options: Options(contentType: "application/json; charset=UTF-8")
    //     )
    //     .then((res) => print(res.statusCode));

    http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(<String, String>{
      //   'title': 'title',
      // }),
    ).then((res) => print(res.statusCode));

    final delay = await Future.delayed(const Duration(seconds: 2), ()async{
      return "done";
    });

    print(delay);

    // var api = NodeApi();
    // var res2 = await api('/test', method: 'get');
    // print(res2);

    // final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'))
    //     .then((value) => print(value.statusCode));


  });


}
