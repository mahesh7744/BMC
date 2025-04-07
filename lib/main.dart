import 'dart:io';

import 'package:bmc/master/accountmaster.dart';
import 'package:bmc/master/cattlefeedmaster.dart';
import 'package:bmc/master/membermaster.dart';
import 'package:bmc/master/rootmaster.dart';
import 'package:bmc/master/sanghmaster.dart';
import 'package:bmc/master/sanghratechart.dart';
import 'package:bmc/master/supplymaster.dart';
import 'package:bmc/master/transportmaster.dart';
import 'package:bmc/master/usermaster.dart';
import 'package:bmc/other/homepage.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.center(); // मध्यभागी ठेवा
      await windowManager.show(); // विंडो दाखवा
      await windowManager.maximize();
    });
  }
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/homepage",
      routes: {
        "/homepage": (context) => Homepage(),
        "/membermaster": (context) => Membermaster(),
        "/accountmaster": (context) => Accountmaster(),
        "/vaparimaster": (context) => Supplymaster(),
        "/sanghmaster": (context) => Sanghmaster(),
        "/sanghratechart": (context) => Sanghratechart(),
        "/rootmaster": (context) => Rootmaster(),
        "/cattlefeedmaster": (context) => Cattlefeedmaster(),
        "/usermaster": (context) => Usermaster(),
        "/transportmaster": (context) => Transportmaster(),
      },
    );
  }
}
