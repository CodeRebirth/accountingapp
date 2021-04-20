

import 'package:flutter/material.dart';

class Billing extends StatefulWidget {
  @override
  _BillingState createState() => _BillingState();
}
class _BillingState extends State<Billing> {
  TextEditingController _itemController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed:(){
              showModalBottomSheet(context: context, builder: (ctx)=>Container(
            height:500,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child:Column(
              children: <Widget>[
                TextFormField(
                decoration: InputDecoration(labelText: "Item Name",labelStyle: TextStyle(color:Colors.black)),
                controller: _itemController,
                ),
                SizedBox(height:30),
                TextFormField(
                decoration: InputDecoration(labelText: "Price",labelStyle: TextStyle(color:Colors.black)), 
                controller: _priceController,
                
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.green)) ,
                onPressed: (){     
                Navigator.of(context).pop();
                }, child: Text("Save"))
              ],
            )
          ),
          isScrollControlled: true
          );
            },
            child: Icon(Icons.add),),
          body: Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
              child:ListView.builder(itemBuilder:(context,index){
               return Center(child: Text("$index"));
              },itemCount: 100,
            )
          ));
  }
}