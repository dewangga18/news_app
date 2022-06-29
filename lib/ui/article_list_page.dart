import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/api/api_services.dart';
import '../data/model/article.dart';
import '../widgets/card_article.dart';
import '../widgets/platform_widget.dart';

class ArticleListPage extends StatefulWidget {
  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late Future<ArticleResult> _article;
 
  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadlines();
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<ArticleResult> snapshot) {
      var state = snapshot.connectionState;
      if (state != ConnectionState.done) {
        return const Center(child: CircularProgressIndicator());
      } else {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
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

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}