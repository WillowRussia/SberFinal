import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../constants.dart';
import '../cashe/data_base.dart';
import '../widget/icon_widget.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({super.key});

  static const keyDarkMode = "key-dark-mode";

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  final IDataBase db = DataBasePrefs();

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(),
        const SizedBox(height: 20),
        builderProfile(),
        const SizedBox(height: 32),
        //buildUser(context),
        buildDarkMode(),
      ],
    );
  }

  Widget buildDarkMode() => SwitchSettingsTile(
    title: 'Темная тема',
    settingKey: HeaderPage.keyDarkMode,
    leading: const IconWidget(
      icon: Icons.dark_mode,
      color: Color(0xFF642ef3)),
    onChange: (state) {
      sup_controller.add(state);
    },
  );

  Widget buildHeader() => const Center(
      child: Text (
          'Настройки',
        style: TextStyle(
          fontSize: 35
        ),
      )
  );

  Widget builderProfile() {
    return Container(
      padding: const EdgeInsets.all(8),
        child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage("assets/icons/sber_logo.png"))),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  //     child: const Icon(
                  //       Icons.camera_alt,
                  //       color: Colors.white,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ]
        )
    );
  }
}





