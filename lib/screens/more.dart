import 'package:flutter/material.dart';
import '../widgets/emptyClipper.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> with TickerProviderStateMixin{
  late AnimationController scaleController;
  late Animation<double> animation;

@override
  void initState() {
    scaleController = new AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    animation = Tween<double>(begin: 0,end:1).animate(CurvedAnimation(parent:scaleController,curve: Curves.easeOut,))..addListener(() {setState(() {
      
    });});
    scaleController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.bottomLeft,
          scale:animation,
          child: ClipPath(
          clipper: MoreClipper(),
          child: Container(
          color: Colors.amber,
          child: Center(
            child:Text("Devloped by Leonard",
            style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30,fontFamily:"Philoshoper"),) 
            ,))
        ),
    );
  }
  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }
}