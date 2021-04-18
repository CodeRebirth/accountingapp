import 'package:flutter/material.dart';
import '../clipper.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:ClipPath(
      clipper: Clipper(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,
            colors: [Colors.blueAccent[700],Colors.white])),
            child:Column(children: [
            ],)
          ),
    ),
  );
  }
}
