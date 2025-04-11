import 'dart:io';

import 'package:bmc/master/accountmaster.dart';
import 'package:bmc/master/canmaster.dart';
import 'package:bmc/master/cattlefeedmaster.dart';
import 'package:bmc/master/membermaster.dart';
import 'package:bmc/master/rootmaster.dart';
import 'package:bmc/master/sanghmaster.dart';
import 'package:bmc/master/sanghratechart.dart';
import 'package:bmc/master/supplymaster.dart';
import 'package:bmc/master/transportmaster.dart';
import 'package:bmc/master/usermaster.dart';
import 'package:bmc/other/app_localizations.dart';
import 'package:bmc/other/app_settingprovider.dart';
import 'package:bmc/other/homepage.dart';
import 'package:bmc/other/locale_provider.dart';
import 'package:bmc/transactions/localmilksale.dart';
import 'package:bmc/transactions/milkcollection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AppState()), // AppState प्रोड्यूसर
        ChangeNotifierProvider(
            create: (_) => LocaleProvider()), // LocaleProvider प्रोड्यूसर
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // 👈 इथे सेट कर
      ),
      locale: localeProvider.locale, // इथे provider वापरा
      supportedLocales: const [
        Locale('en'),
        Locale('mr'),
        Locale('kn'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
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
        "/canmaster": (context) => Canmaster(),
        "/milkcollection": (context) => Milkcollection(),
        "/localmilksale": (context) => Localmilksale(),
      },
    );
  }
}
