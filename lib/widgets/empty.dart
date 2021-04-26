import 'emptyClipper.dart';
import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
@override
  void initState() {
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin:0.0, end:200).animate(animationController)..addListener(() {setState(() {
      
    });});
    animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.topCenter,
        children: [
        ClipPath(
        clipper: EmptyClipper(),
        child: Container( 
        color: Colors.green
        )),
       Positioned(
         top: animation.value,
         child: Container(
           child:Text("Let's add bill",style:TextStyle(color: Colors.black,fontSize: 30))
         ),
       ),
        ]
    );
  }
}