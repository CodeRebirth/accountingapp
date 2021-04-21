import 'package:flutter/material.dart';
import 'homepage.dart';
import 'more.dart';
import 'settings.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;
  final List<Widget> _widget = [
    HomePage(),
    Settings(),
    More(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        elevation: 0,
        selectedItemColor: Colors.white,        
        backgroundColor: Colors.amber,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
        BottomNavigationBarItem( 
          icon: Icon(Icons.home),label: "Home"
          ),
         BottomNavigationBarItem(
           icon: Icon(Icons.settings),label: "Settings"
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.more),label: "More"
             )
      ],),
      body: _widget[_currentIndex],
    );
  }
}
