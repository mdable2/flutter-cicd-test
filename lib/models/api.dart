class API {
  final String secret;
  final String clientID;

  API({this.secret = "", this.clientID = ""});

  factory API.fromJson(Map<String, dynamic> jsonMap) {
    return new API(secret: jsonMap["secret"], clientID: jsonMap["clientID"]);
  }
}