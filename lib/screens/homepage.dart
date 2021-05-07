import 'package:flutter/material.dart';
import '../widgets/postCarousal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:Container(
        child:PostCarousal()       
),
);}
}

