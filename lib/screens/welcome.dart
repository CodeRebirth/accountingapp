import 'package:flutter/material.dart';
import '../clipper.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin{
  AnimationController animationController;
  Animation<double> animate;
@override
  void initState() {
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds:500));
    animate = Tween<double>(begin: 0,end:1).animate(animationController)..addListener(() {
      setState(() {
        
      });
    });
    animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton:  Container(height:70,width:70,child: FloatingActionButton(backgroundColor: Colors.black,child:Icon(Icons.arrow_right,size:50),onPressed: (){
      Navigator.of(context).pushNamed("homepage");
    },)),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body:Stack(
      children: [
        Transform.scale(
          scale: animate.value,
            child: Container(
            color: Colors.amber[300],
          ),
        ),
         ClipPath(
        clipper: Clipper(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,
              colors: [Colors.amber[700],Colors.red])),
              child:Column(children: [
              ],)
            ),
      ),
       Positioned(
         top: 140,
         bottom:0,
         left:30,
         child: Column(
           children: [
             Text("WELCOME TO",style: Theme.of(context).textTheme.headline1,),
             SizedBox(height: 20,),
             Text("AKOUNT",style: TextStyle(fontSize: 60,color: Colors.white,letterSpacing: 10))
           ],
         ),),
      ],
    ),
  );
  }
}
