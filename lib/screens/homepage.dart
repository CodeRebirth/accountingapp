import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color:Colors.amber
              ),
              Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                  Align(
                    alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left:10.0,right:10.0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        InkWell(onTap: (){},child: Icon(Icons.home,size: 35)),
                        InkWell(onTap: (){},child: Icon(Icons.settings,size: 35,)),
                        ],
                    ),
                      ),
                  ),
                ],
              ),
              Container(
                    height:500,
                    width: 400,
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                       child: PageView(
                       children: [
                         Container(
                            color: Colors.white,
                            child: Center(child:Text("Billing")),
                         ),
                         Container(
                            color: Colors.blue,
                            child: Center(child:Text("Inventory")),
                         ),
                         Container(
                            color: Colors.orange,
                            child: Center(child:Text("History")),
                         ),
                       ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    child: Text("Scroll",style: Theme.of(context).textTheme.headline1,))
            ], 
          )
    );
  }
}