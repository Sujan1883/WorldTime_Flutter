import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({required this.location,required this.flag,required this.url}):time='',isDayTime=false;
    Future<void> getTime() async {
      // Simulate Network Request For A Username
      // String username = await Future.delayed(Duration(seconds: 3), () {
      //   return 'Sujan';
      // });
      //
      // // Simulate Network Request For A Bio Of A Username
      // String bio = await Future.delayed(Duration(seconds: 2), () {
      //   return 'Writer, Critic And Male';
      // });
      // print('$username - $bio');

      // Corrected code
      //Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      //print(response.body);
      //Map data=jsonDecode(response.body);
      //print(data);
      //print(data['userId']);
      //Make Request
      try {
        Response response = await get(
            Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);
        //print(data);

        //Get Properties
        String datetime = data['datetime'];
        //String offset=data['utc_offset'];
        String offset = data['utc_offset'].substring(1, 3);
        //print(datetime);
        //print(offset);
        //Create Datetime Object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        //print(now);

        // time = now.toString();
        //Set Time Property
        isDayTime= now.hour > 6 && now.hour < 18 ? true : false ;
        time = DateFormat.jm().format(now);
      }
      catch (e) {
        print('$e');
        print('Could Not Get Time');
      }
    }

}
