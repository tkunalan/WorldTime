import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String flag;
  String time;
  bool isDayTime;

  WorldTime({this.location,this.url,this.flag});

  Future<void> getTime() async {
    try {
      //Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Colombo');
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      String dateTime = data['datetime'];
      //print(data['utc_offset']); +05:30
      String offSetHour = data['utc_offset'].substring(1, 3); // 05
      String offSetMinutes = data['utc_offset'].substring(4, 6); // 30

      //print('offSetMinutes $offSetMinutes');


      DateTime now = DateTime.parse(dateTime);

      //print('hour ${now.hour}');

      now = now.add(Duration(hours: int.parse(offSetHour),minutes: int.parse(offSetMinutes)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;


      time = DateFormat.jm().format(now);
    }catch(e){
      print(e);
      time = 'Something went wrong!';
    }
    //print(offSet);
  }
}