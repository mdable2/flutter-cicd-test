import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_hello_world/screens/camera/camera.dart';

class CameraState extends State<CameraWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();
  CameraController controller;
  
  // Variables for keeping state and image path for camera operations
  bool isReady = false;
  bool showCamera = true;
  String imagePath;
}
Future<String> takePicture() async {
  final Directory extDir = await getApplicationDocumentsDirectory();
}
class BeerListPage extends StatefulWidget {
  BeerListPage({Key key}) : super(key: key);

  @override
  BeerListPageState createState() => BeerListPageState();
}

class BeerListPageState extends State<BeerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      child: new Center(
        child: new FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/beers.json'),
            builder: (context, snapshot) {
              var beers = json.decode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var beer = beers[index];
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: " + beer['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        new Text("Country: " + beer['country'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        new Text("ABV: " + beer['abv'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        new Image.network(beer['image'], height: 200)
                      ],
                    ),
                  );
                },
                itemCount: beers == null ? 0 : beers.length,
              );
            }),
      ),
    ));
  }
}