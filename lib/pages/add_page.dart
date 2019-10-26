import 'dart:convert';

import 'package:comic_app/data/entidades/comic_request.dart';
import 'package:comic_app/data/entidades/comic_response.dart';
import 'package:comic_app/data/get_comics.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  TextEditingController titleControler = TextEditingController();
  TextEditingController autorControler = TextEditingController();
  TextEditingController imagenControler = TextEditingController();
  TextEditingController descripControler = TextEditingController();
  TextEditingController rewardsControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Insertar nuevo registro",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: titleControler,
              decoration: InputDecoration(
                  hintText: "Escriba el nombre del cómic",
                  labelText: 'Nombre del cómic',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: autorControler,
              decoration: InputDecoration(
                  hintText: "Escriba el nombre del autor",
                  labelText: 'Nombre del autor',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: imagenControler,
              decoration: InputDecoration(
                  hintText: "Imagen",
                  labelText: 'Pegue la url de la imagen',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: descripControler,
              decoration: InputDecoration(
                  hintText: "Descripcion",
                  labelText: 'Escriba una descripcion',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: rewardsControler,
              decoration: InputDecoration(
                  hintText: "Escriba la puntuacion",
                  labelText: 'Del 1 al 5',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
              textColor: Colors.white,
              child: Text("Enviar datos"),
              color: Colors.blue,
              onPressed: () async {
                ComicRequest newComic = ComicRequest(
                    comic: titleControler.text,
                    author: autorControler.text,
                    url: imagenControler.text,
                    description: descripControler.text,
                    rewards: rewardsControler.text);

                ComicResponse response =
                    await menuProvider.createPost(body: newComic.toJson());

                print(response.uuid);
              },
            )
          ],
        ),
      ),
    );
  }
}
