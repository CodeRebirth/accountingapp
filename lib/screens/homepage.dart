import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          height:MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.yellow[200]
          ),
          child:Column(children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.05),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.home,size:30),
                  Icon(Icons.settings,size:30),
                ],
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.05),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              child: PageView(children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.white
              ),
              ],),
            )
          ],)
        )
    );
  }
}