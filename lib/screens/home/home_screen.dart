import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../beer_list/beer_list.dart';
import '../camera//camera.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final widgetOptions = [
    new BeerListPage(),
    new CameraWidget(),
    Text('Favourites'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beer App'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), title: Text('Beers')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text('New Beer')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favourites')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

