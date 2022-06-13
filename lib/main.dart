import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/detail.dart';
import 'package:news_app/new_list_page.dart';
import 'package:news_app/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0)
              )
            )
          )
        )
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => NewsListPage(),
        DetailPage.routeName: (context) => DetailPage(
          article: ModalRoute.of(context)?.settings.arguments as Article),
        aWebView.routeName: ((context) => aWebView(
          url: ModalRoute.of(context)?.settings.arguments as String,
        ))    
      },
    );
  }
}

