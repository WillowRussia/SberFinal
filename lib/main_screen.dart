import 'dart:async';
import 'package:sber_final/Navigation/nav_bar.dart';
import 'package:sber_final/Navigation/nav_model.dart';
import 'package:flutter/material.dart';
import 'package:sber_final/market/home/home_screen.dart';
import 'package:sber_final/settings/settings_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _Mainmarkettate();
}

class _Mainmarkettate extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final SelectNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;
  List<NavModel> items = [];



  @override
  void initState() {
    super.initState();

    items = [
      NavModel(
        page: HomeScreen(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 2),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 3),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const SettingsPage(),
        navKey: profileNavKey,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
            key: page.navKey,
            observers: [
              HeroController(),
            ],
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => page.page)
              ];
            },
          ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 50),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () => debugPrint("Add Button pressed"),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.green),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.memory_outlined,
              size: 30,
              // Icons.adb_rounded,
              color: Colors.green,
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );

    RectTween _createRectTween(Rect begin, Rect end) {
      return MaterialRectArcTween(begin: begin, end: end);
    }
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tab $tab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tab $tab'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Page(tab: tab),
                  ),
                );
              },
              child: const Text('Go to page'),
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}