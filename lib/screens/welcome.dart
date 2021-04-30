import 'package:flutter/material.dart';
import '../widgets/clipper.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animate;
  late AnimationController opacityController;
  late Animation<double> opacity;
  
@override
  void initState() {
    animationController = new AnimationController(vsync: this,duration: Duration(milliseconds:1000));
    animate = Tween<double>(begin: 0,end:1).animate(CurvedAnimation(parent: animationController,curve:Curves.easeOut))..addListener(() {
      setState(() {
        
      });
    });
    animationController.forward();
    opacityController = new AnimationController(vsync: this,duration: Duration(milliseconds:2000));
    opacity = Tween<double>(begin: 0,end:1).animate(opacityController)..addListener(() {
      setState(() {
        
      });
    });
    opacityController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton:  Container(height:70,width:70,child: FloatingActionButton(backgroundColor: Colors.black,child:Icon(Icons.arrow_right,size:50),onPressed: (){
      Navigator.of(context).pushNamed("navpage",);
    },)),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body:Stack(
      children: [
        Transform.scale(
          scale: animate.value,
            child: Container(
            color: Colors.blue[900],
          ),
        ),
         ClipPath(
        clipper: Clipper(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,end: Alignment.topCenter,
              colors: [Colors.white,Colors.white])),
              child:Column(children: [
              ],)
            ),
      ),
      Positioned(
           top: 140,
           bottom:0,
           left:30,
           child: Opacity(
               opacity: opacity.value,
               child: Column(
               children: [
                 Text("WELCOME TO",style: Theme.of(context).textTheme.headline1,),
                 SizedBox(height: 20,),
                 FittedBox(
                   fit: BoxFit.cover,
                   child: Text("AKOUNT",style: TextStyle(fontSize:50,color: Colors.white,letterSpacing: 10,fontWeight: FontWeight.bold))
                   )
               ],
             ),
           ),),
      ]),
  );
  }
@override
  void dispose() {
    animationController.dispose();
    opacityController.dispose();
    super.dispose();
  }
}
