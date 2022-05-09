import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/article_webview_pages.dart';
import 'package:news_app/pages/detail_pages.dart';
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
          DetailPage.routeName: (context) => DetailPage(
                article: ModalRoute.of(context)?.settings.arguments as Article,
              ),
          ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String),
        });
  }
}
