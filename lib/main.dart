/* FOLLOWING THIS TUTORIAL: https://blog.brainsandbeards.com/bottom-navigation-with-a-list-screen-in-flutter-d517dc6f22f1 */

import 'screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Beer Recommendations!',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}