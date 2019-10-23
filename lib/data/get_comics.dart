import 'package:http/http.dart' as http;
import 'dart:convert';

class _MenuProvider {
  _MenuProvider(){

  }

  Future<Map> getList(String route) async {
    final resp = await http.get('http://192.168.43.174:8000/comica/v1/comics/$route');
    Map dataMap = json.decode(resp.body);
    print(dataMap);
    return dataMap;
  }

}

final menuProvider = new _MenuProvider();
