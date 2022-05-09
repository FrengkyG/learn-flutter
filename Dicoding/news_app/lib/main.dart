import 'package:flutter/material.dart';
import 'package:news_app/pages/news_list_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: NewsListPage.routeName,
        routes: {
          NewsListPage.routeName: (context) => NewsListPage(),
        });
  }
}
