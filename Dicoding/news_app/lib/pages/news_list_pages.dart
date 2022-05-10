import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/detail_pages.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);
  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: _buildList(context));
  }
}

Widget _buildList(BuildContext context) {
  return FutureBuilder<String>(
    future: DefaultAssetBundle.of(context).loadString('assets/articles.json'),
    builder: (context, snapshot) {
      final List<Article> articles = parseArticles(snapshot.data);
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return _buildArticleItem(context, articles[index]);
        },
      );
    },
  );
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: article.urlToImage,
        child: Image.network(
          article.urlToImage,
          width: 100,
        ),
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName, arguments: article);
      });
}
