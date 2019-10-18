import "beer.dart" show Beer;
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserBeerRepo {
  Future<Stream<Beer>> getBeers() async {
    //TODO: Build url query to get User's beer preferences using access token
    //NOTE: User is authenticated at this point
    final String url =
        'https://api.untappd.com//v4/user/beers/<Replace with user token>';

    final client = new http.Client();
    final streamedData = await client.send(http.Request('get', Uri.parse(url)));

    return streamedData.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => Beer.fromJson(data));
  }
}
