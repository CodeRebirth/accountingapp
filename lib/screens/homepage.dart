import 'package:flutter/material.dart';
import '../widgets/postCarousal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle:true,
        title:Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
        body:Container(
        child:PostCarousal()       
),
);
}
}

