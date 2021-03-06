import 'package:flutter/material.dart';
import '../widgets/homepage.dart';
import '../widgets/more.dart';
import '../widgets/mybill.dart';
import '../widgets/settings.dart';
import '../provider/auth.dart';
import 'package:provider/provider.dart';


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
      appBar: AppBar(
        centerTitle:true,
        title:Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.black)),
        actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon:Icon(Icons.logout),onPressed: (){
                Provider.of<Auth>(context,listen:false).logout();
              }),
            )
          ],
        elevation: 0,
      ),
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

