/*
 * @Description: 
 * @Author: Lewis
 * @Date: 2022-09-29 21:18:07
 * @LastEditTime: 2022-12-15 00:35:29
 * @LastEditors: Lewis
 */
import 'package:flutter/material.dart';
import 'package:location_project/pages/choose_location.dart';
import 'package:location_project/pages/loading.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
