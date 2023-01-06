/*
 * @Description: 
 * @Author: Lewis
 * @Date: 2022-12-15 01:02:17
 * @LastEditTime: 2023-01-07 00:18:07
 * @LastEditors: Lewis
 */
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = '';
  String time = '';
  String flag = '';
  String url = '';
  bool isDayTime = false;

  WorldTime({this.location = '', this.flag = '', this.url = ''});
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (err) {
      print('caught error,$err');
      time = 'could not get time data';
    }
  }
}
