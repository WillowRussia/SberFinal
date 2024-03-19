import 'package:shared_preferences/shared_preferences.dart';

class KeyStore {
  KeyStore._();

  static const String nightModeEnabled = 'nightModeEnabled';
  static const bool nightModeEnabledDefault = false;

  static const String appLocale = 'appLocale';
  static const String appLocaleDefault = 'ru';

  static const String textScaleFactor = 'textScaleFactor';
  static const double textScaleFactorDefault = 1.1;
}

/// Абстрактный класс для сохранения настроек приложения
abstract class IDataBase {
  /// Для начала работы нужна инцелизация
  Future<void> init();

  /// Загружает данные из хранилища по ключу
  Future<T> get<T>(String key, T defaultValue);

  /// Сохраняет данные в хранилище по ключу.
  Future<void> set<T>(String key, T value);

}

class DataBasePrefs implements IDataBase {
  DataBasePrefs();

  late final SharedPreferences _prefs;


  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  @override
  Future<T> get<T>(String key, T defaultValue) async {
    Object? value;
    await SharedPreferences.getInstance();
    try {
      if (sameTypes<T, List<String>>()) {
        value = _prefs.getStringList(key);
      } else {
        value = _prefs.get(key);
      }

      // значения ещё нет в бд
      if (value == null) {
        return defaultValue;
      }

      return value as T;
    } catch (e) {
    return defaultValue;
  }
  }

  @override
  Future<bool> set<T>(String key, T value) async {
    await SharedPreferences.getInstance();
    if (sameTypes<T, bool>()) {
      return _prefs.setBool(key, value as bool);
    }

    if (sameTypes<T, int>()) {
      return _prefs.setInt(key, value as int);
    }

    if (sameTypes<T, double>()) {
      return _prefs.setDouble(key, value as double);
    }

    if (sameTypes<T, String>()) {
      return _prefs.setString(key, value as String);
    }

    if (sameTypes<T, List<String>>()) {
      return _prefs.setStringList(key, value as List<String>);
    }

    if (value is Enum) {
      return _prefs.setInt(key, value.index);
    }

    throw Exception('Такого типа нету в базе данных');
  }

  bool sameTypes<S, V>() {
    void func<X extends S>() {}
    return func is void Function<X extends V>();
  }
}