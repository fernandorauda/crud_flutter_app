import 'package:comic_app/pages/add_page.dart';
import 'package:comic_app/pages/comics_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    ComicPage(),
    AddPage()
  ];

  void onTapped(int index){
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comica'),
        backgroundColor: Colors.blueAccent,
      ),
      body: widgetsChildren[indexTap],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Comics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Agregar'),
          )
        ],
        onTap: onTapped,
      ),
    );
  }
}
