import 'package:comic_app/data/entidades/comic_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class _MenuProvider {
  _MenuProvider() {}

  Future<Map> getList(String route) async {
    final resp =
        await http.get('http://192.168.43.174:8000/comica/v1/comics/$route');
    Map dataMap = json.decode(resp.body);
    print(dataMap);
    return dataMap;
  }

  Future<ComicResponse> createPost({Map body}) async {
    print(body);
    final url = "http://192.168.43.174:8000/comica/v1/comics/";
    return http.post(url,
        body: body,
        headers: {"Accept": "application/json"}).then((http.Response response) {
      final int statusCode = response.statusCode;


      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw Exception("Hubo un error al enviar los datos $statusCode");
      }
      print("La solicitud fue resulta correctamente, creado $statusCode");

      return ComicResponse.fromJson(json.decode(response.body));
    });
  }
}

final menuProvider = new _MenuProvider();
