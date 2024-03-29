import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:sber_final/main_screen.dart';
import 'package:sber_final/constants.dart';
import 'package:sber_final/settings/header_page.dart';

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription = sup_controller.stream.listen((index) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var isDarkMode = Settings.getValue<bool>(HeaderPage.keyDarkMode, defaultValue: false)!;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'SberShop',
        theme: isDarkMode? ThemeData.dark() : ThemeData.light(),

      // themeMode: isDarkMode ? ThemeMode.dark: ThemeMode.light ,
      home: MainScreen(),

    );
  }
}

