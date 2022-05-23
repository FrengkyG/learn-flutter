import 'package:flutter/material.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/pages/article_webview_page.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;
  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: article.urlToImage!,
              child: Image.network(article.urlToImage!),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description ?? "-"),
                  const Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                  const Divider(color: Colors.grey),
                  Text('Date: ${article.publishedAt}'),
                  const SizedBox(height: 10),
                  Text('Author: ${article.author}'),
                  const Divider(color: Colors.grey),
                  Text(
                    article.content ?? "-",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Read more'),
                    onPressed: () {
                      Navigation.intentWithData(
                          ArticleWebView.routeName, article.url);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
