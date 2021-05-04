
import 'package:flutter/material.dart';
import '../widgets/clipper.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin{
  var signupmode = false;
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
    body:Stack(
      alignment: Alignment.bottomCenter,
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
               ],))),
      Container(
        color: Colors.white.withOpacity(1),
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        // color: Colors.black.withOpacity(0.4),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.yellow[900],
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.yellow[900]),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.yellow[900]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.yellow[900]!,
                    width: 1.0,
                  ),
                ),)
            ),
            SizedBox(height:20),
            TextFormField(
              decoration:InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.yellow[900]),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.yellow[900]!,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.yellow[900]!,
                    width: 1.0,
                  ),
                ),)),
            SizedBox(height:20),
            Visibility(
              visible: signupmode?true:false,
                child: TextFormField(
                decoration:InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Colors.yellow[900]),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.yellow[900]!,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.yellow[900]!,
                      width: 1.0,
                    ),
                  ),)),
            ),
                SizedBox(height:20),
                OutlinedButton(
                  style: ButtonStyle(
                    elevation:MaterialStateProperty.all(5),
                    backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                    minimumSize: MaterialStateProperty.all(Size(100,40))
                    ),
                  onPressed: (){
                }, child: Text(signupmode?"Sign up":"Log in",style: TextStyle(color: Colors.white),)),
                Spacer(flex: 1,),
                InkWell(
                    onTap:(){
                      setState(() {
                        signupmode = true;
                      });
                    },
                    child: Text("No Account? Sign Up",style: TextStyle(color: Colors.yellow[900])),),
          ],
        ),
      )
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
