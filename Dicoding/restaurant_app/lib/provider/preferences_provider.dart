import 'package:flutter/material.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyNotificationActive();
  }

  bool _isDailyNotificationActive = false;

  bool get isDailyNotificationActive => _isDailyNotificationActive;

  void _getDailyNotificationActive() async {
    _isDailyNotificationActive =
        await preferencesHelper.isDailyNotificationActive;
    notifyListeners();
  }

  void enableDailyNotificationActive(bool value) {
    preferencesHelper.setDailyNotificationActive(value);
    _getDailyNotificationActive();
  }
}
