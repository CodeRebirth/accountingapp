import 'package:flutter/material.dart';
import 'homepage.dart';
import 'more.dart';
import 'mybill.dart';
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
    MyBill(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        elevation: 0,
        selectedItemColor: Colors.white,        
        backgroundColor: Colors.blue[900],
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
           ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),label: "Bills"
        )     
      ],),
      body: _widget[_currentIndex],
    );
  }
}

