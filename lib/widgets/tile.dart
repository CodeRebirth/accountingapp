import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final List<dynamic> keys;
  final index;
  Tile(this.index,this.keys);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.green,
      elevation:0,
                            margin:EdgeInsets.all(5), 
                            child: ListTile(
                                horizontalTitleGap: 50,
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(
                                radius:30,
                                backgroundColor:Colors.blue[900],
                                child: Padding(
                                  padding: EdgeInsets.all(1),
                                  child: FittedBox(child:Text('$index',style: TextStyle(color: Colors.white,fontSize:20))
                                ),
                              )
                        ),
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(keys[index],
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30)
                          ),
                        ),
                        ),
                );
  }
}