import 'package:flutter/material.dart';
import '../widgets/emptyClipper.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: MoreClipper(),
        child: Container(
        color: Colors.amber,
        child:Center(child:Text("Devloped by Leonard",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30,fontFamily:"Philoshoper"),) ,)
      ),
    );
  }
}