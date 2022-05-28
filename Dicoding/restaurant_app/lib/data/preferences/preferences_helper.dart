import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  static const dailyNotificationActive = 'DAILY_NOTIFICATION_ACTIVE';

  PreferencesHelper({required this.sharedPreferences});

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotificationActive) ?? false;
  }

  void setDailyNotificationActive(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotificationActive, value);
  }
}
