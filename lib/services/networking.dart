import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({@required this.url});
  final String url;

  Future fetchAlbum() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print('!!!!!!!!!!!!!!!!!!!!networking');
      print(response.statusCode);
    }
  }
}
