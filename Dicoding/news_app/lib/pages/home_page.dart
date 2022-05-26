import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/pages/article_list_page.dart';
import 'package:news_app/pages/bookmarks_page.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/pages/settings_page.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/provider/scheduling_provider.dart';
import 'package:news_app/utils/notification_helper.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    ArticleListPage(),
    BookmarksPage(),
    SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: 'Headline',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS
          ? CupertinoIcons.bookmark
          : Icons.collections_bookmark),
      label: BookmarksPage.bookmarksTitle,
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }
}
