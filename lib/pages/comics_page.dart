import 'package:comic_app/data/get_comics.dart';
import 'package:comic_app/pages/comic_detail_pages.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ComicPage extends StatefulWidget {
  @override
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: _lista(),
      onRefresh: refresh,
    );
  }

  Future<Null> refresh() async {
    final duracion = Duration(seconds: 4);
    new Timer(duracion, (){
      _lista();
    });
    if(mounted){
      setState(() {
      });
    }
    return Future.delayed(duracion);
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.getList(''),
      initialData: {},
      builder: (context, AsyncSnapshot<Map> snapshot) {
        List<dynamic> data = snapshot.data['comics'];
        final List<Widget> comics = [];

        if (data == null) {
          return Center(

            child: CircularProgressIndicator(),

          );
        } else {
          data.forEach((comic_card) {
            final widgetComic = Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 500,
                      width: 325,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(comic_card['url']),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 435, 15, 15),
                      height: 50,
                      width: 295,
                      color: Colors.black38,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Text(
                          comic_card['comic'] + " - " + comic_card['author'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ComicDetailPage(uuid: comic_card['uuid'])
                  ));
                },
              ),
            );
            comics.add(widgetComic);
          });
          return ListView(
            children: comics,
          );
        }
      },
    );
  }
}
