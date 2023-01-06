/*
 * @Description: 
 * @Author: Lewis
 * @Date: 2022-09-29 23:37:39
 * @LastEditTime: 2023-01-07 00:42:49
 * @LastEditors: Lewis
 */

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments;

    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    final Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text('Edit location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
