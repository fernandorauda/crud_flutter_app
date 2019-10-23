import 'package:comic_app/pages/comic_detail_pages.dart';
import 'package:comic_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Home(),
        '/comicdetail' : (context) => ComicDetailPage(),
      },
    );
  }
}
