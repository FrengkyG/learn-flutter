import 'package:cupertino_widget/pages/feeds_page.dart';
import 'package:cupertino_widget/pages/search_page.dart';
import 'package:cupertino_widget/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ]),
        tabBuilder: (content, index) {
          switch (index) {
            case 0:
              return const FeedsPage();
            case 1:
              return const SearchPage();
            case 2:
              return const SettingsPage();
            default:
              return const Center(
                child: Text('Page not found!'),
              );
          }
        });

    // return CupertinoPageScaffold(
    //   navigationBar: CupertinoNavigationBar(
    //     middle: Text('Cupertino Apps'),
    //   ),
    //   child: Center(
    //     child: Text(
    //       'Home Page',
    //       style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
    //     ),
    //   ),
    // );
  }
}
