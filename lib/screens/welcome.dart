import 'package:flutter/material.dart';

class Welcome extends StatefulWidget{
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.of(context).pushNamed("homepage");
      },child: Icon(Icons.arrow_right,size: 50,),backgroundColor: Theme.of(context).primaryColor,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        color: Colors.white,
        height:MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100,bottom: 50),
              child: Text("Welcome to Akount",
              style:TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize:Theme.of(context).textTheme.headline1.fontSize)
                ),
            ),
            ClipOval(
                  child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width:MediaQuery.of(context).size.width * 0.8,
                  child: Image.network(
                      "https://images.unsplash.com/photo-1618452808296-6f9cb49a0c2a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzM3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}