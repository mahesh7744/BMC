import 'dart:io';

import 'package:bmc/master/membermaster.dart';
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
      initialRoute: "/membermaster",
      routes: {
        "/membermaster": (context) => Membermaster(),
      },
    );
  }
}
