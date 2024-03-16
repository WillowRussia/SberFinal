import 'package:flutter/material.dart';
import 'package:sber_final/main_screen.dart';
import 'package:sber_final/constants.dart';
import 'package:sber_final/market/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'SberShop',
        theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: MainScreen(),

    );
  }
}

