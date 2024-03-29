import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../widget/icon_widget.dart';
import 'header_page.dart';
import 'notification_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const HeaderPage(),
            SettingsGroup(
              title: "Общие настройки",
              children: <Widget>[
                const AccountPage(),
                NotificationsPage(),
                buildLogout(),
                buildDeleteAccount(),
                //buildDeleteAccount(),
              ],
            ),
            const SizedBox(height: 32,),
            SettingsGroup(
                title: "Обратная связь",
                children: <Widget>[
                  const SizedBox(height: 8,),
                  buildReportBug(),
                  buildSendFeedBack(),
                ])
          ],
        ),
      ),
    );
  }


  Widget buildLogout() =>
      SimpleSettingsTile(
        title: "Выход",
        subtitle: "",
        leading: const IconWidget(
          icon: Icons.logout, color: Colors.blueAccent,),
        onTap: () {},
      );

  Widget buildDeleteAccount() =>
      SimpleSettingsTile(
        title: "Удалить аккаунт",
        subtitle: "",
        leading: const IconWidget(icon: Icons.delete, color: Colors.pink,),
        onTap: () {
          Settings.clearCache();
        },
      );

  Widget buildReportBug() =>
      SimpleSettingsTile(
        title: "Сообщить об ошибке",
        subtitle: "",
        leading: const IconWidget(icon: Icons.bug_report, color: Colors.teal,),
        onTap: () {},
      );

  Widget buildSendFeedBack() =>
      SimpleSettingsTile(
        title: "Отправить отзыв",
        subtitle: "",
        leading: const IconWidget(icon: Icons.thumb_up, color: Colors.purple,),
        onTap: () {},
      );

}




  class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static const keyLanguage = 'key-language';
  static const keyPassword = 'key-password';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
      title: "Настройки аккаунта",
      subtitle: "Приватность, Смена пароля",
      leading: const IconWidget(icon: Icons.person, color: Colors.green,),
      child: SettingsScreen(title: "Настройки аккаунта",
      children: <Widget>[
        buildLanguage(),
        buildPassword(),
        buildPrivacy(context),
        buildSecurity(context),
        buildAccountInfo(context),
      ],
    )
  );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: "Приватность",
        subtitle: "",
        leading: const IconWidget(icon: Icons.lock, color: Colors.blue,),
        onTap: () {},
      );

  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
        title: "Безопасность",
        subtitle: "",
        leading: const IconWidget(icon: Icons.security, color: Colors.red,),
        onTap: () {},
      );
  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
        title: "Информация о аккаунте",
        subtitle: "",
        leading: const IconWidget(icon: Icons.text_snippet, color: Colors.purple,),
        onTap: () {},
      );

  Widget buildLanguage() => DropDownSettingsTile(
    settingKey: keyLanguage,
    title: "Города",
    selected: 6,
    subtitle: "",
    leading: const IconWidget(icon: Icons.language, color: Colors.green,),
    values: const <int, String> {
      1: "Анжеро-Судженск",
      2: "Белово",
      3: "Берёзовский",
      4: "Гурьевск",
      5: "Калтан",
      6: "Кемерово",
      7: "Киселёвск",
      8: "Ленинск-Кузнецкий",
      9: "Мариинск",
      10: "Междуреченск",
      11: "Мыски",
      12: "Новокузнецк",
      13: "Осинники",
      14: "Полысаево",
      15: "Прокопьевск",
      16: "Салаир",
      17: "Тайга",
      18: "Таштагол",
      19: "Топки",
      20: "Юрга",
    },
    onChange: (language) {/*NOOP*/},
  );


  Widget buildPassword () => TextInputSettingsTile(
    settingKey: keyPassword,
    title: "Пароль",
      obscureText: true,
      validator: (password) => password != null && password.length >= 6
          ?  null
          : 'Enter 6-characters',

  );

 }


