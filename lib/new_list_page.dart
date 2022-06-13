import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/detail.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> artic = parseArticle(snapshot.data);
          return ListView.builder(
              itemCount: artic.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, artic[index]);
              });
        },
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Article artic) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: artic.urlToImage,
        child: Image.network(artic.urlToImage, width: 100)
      ),
      title: Text(artic.title),
      subtitle: Text(artic.author),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName, arguments: artic);
      },
    );
  }
}