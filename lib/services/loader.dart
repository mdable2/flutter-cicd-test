import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;
import '../models/api.dart' show API;

class Loader {
  final String path;

  Loader({this.path = 'assets\\api.json'});

  //loadstring but with callback to parse
  Future<API> load() {
    return rootBundle.loadStructuredData<API>(this.path, parseJson);
  }

  Future<API> parseJson(String jsonStr) async =>
      API.fromJson(json.decode(jsonStr));
}
