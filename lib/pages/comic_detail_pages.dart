import 'package:comic_app/data/get_comics.dart';
import 'package:flutter/material.dart';

class ComicDetailPage extends StatefulWidget {

  final String uuid;
  ComicDetailPage({Key key, this.uuid}) : super(key: key);

  @override
  _ComicDetailPageState createState() => _ComicDetailPageState(uuid);
}

class _ComicDetailPageState extends State<ComicDetailPage> {

  final String uuid;
  _ComicDetailPageState(this.uuid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: FutureBuilder(
        future: menuProvider.getList(uuid),
        initialData: {},
        builder: (context, AsyncSnapshot<Map> snapshoot) {

              if (snapshoot.data['comic'] != null){
                String name = snapshoot.data['comic'];
                String author = snapshoot.data['author'];
                String description = snapshoot.data['description'];
                String url = snapshoot.data['url'];
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    Text(name),
                    Text(author),
                    Text(description),
                    Image.network(url, width: 100, height: 100,),
                  ],
                );
              }
              return CircularProgressIndicator();
        },
      ),
    );
  }
}
