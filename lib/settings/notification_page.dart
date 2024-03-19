
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../widget/icon_widget.dart';

class NotificationsPage extends StatelessWidget {
  static const keyNews = 'key-news';
  static const keyActivity = 'key-activity';
  static const keyAppUpdates = 'key-appUpdates';

  @override
  Widget build(BuildContext context) =>
      SimpleSettingsTile(
        title: 'Уведомления',
        subtitle: 'Новостная рассылка, обновления',
        leading: const IconWidget(
          icon: Icons.notifications,
          color: Colors.redAccent,),
        child: SettingsScreen(
          title: "Уведомления",
          children: <Widget>[
            buildActivity(),
            buildNewsletter(),
            buildAppUpdates() ,
          ],
        ),
      );



  Widget buildActivity() => SwitchSettingsTile(
      settingKey: keyActivity,
      title: 'Активность аккаунта',
      leading: const IconWidget (
        icon: Icons.person,
        color: Colors.orange,
      )
  );

  Widget buildNewsletter() => SwitchSettingsTile(
      settingKey: keyNews,
      title: 'Новостная рассылка',
      leading: const IconWidget (
        icon: Icons.text_snippet,
        color: Colors.red,
      )
  );

  Widget buildAppUpdates() => SwitchSettingsTile(
      settingKey: keyAppUpdates,
      title: 'Обновления',
      leading: const IconWidget (
        icon: Icons.update,
        color: Colors.green,
      )
  );
}