import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/pages/detail_page.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/widgets/card_article.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

class ArticleListPage extends StatelessWidget {
  late Future<ArticlesResult> _article;
  ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.articles.length,
            itemBuilder: (context, index) {
              var article = state.result.articles[index];
              return CardArticle(article: article);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: Text(""),
          );
        }
      },
    );
  }
  /*
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data?.articles[index];
                return CardArticle(article: article!);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Text('');
          }
        }
      },
    );
    */

}
