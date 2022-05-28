import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings_page';
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Material(
                    child: ListTile(
                        title: const Text('Daily Notification'),
                        trailing: Consumer<SchedulingProvider>(
                          builder: (context, scheduled, _) {
                            return Switch.adaptive(
                              value: provider.isDailyNotificationActive,
                              onChanged: (value) async {
                                scheduled.scheduledDailyNotification(value);
                                provider.enableDailyNotificationActive(value);
                              },
                            );
                          },
                        ))),
              ],
            ),
          ),
        );
      },
    ));
  }
}
