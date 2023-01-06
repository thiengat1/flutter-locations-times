/*
 * @Description: 
 * @Author: Lewis
 * @Date: 2022-09-29 23:47:09
 * @LastEditTime: 2023-01-07 00:18:00
 * @LastEditors: Lewis
 */
import 'package:flutter/material.dart';
import 'package:location_project/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    // setState(() {
    //   time = instance.time;
    // });
    //print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
