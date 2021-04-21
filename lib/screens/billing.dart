import 'package:flutter/material.dart';
import '../models/product.dart';

class Billing extends StatefulWidget {
  @override
  _BillingState createState() => _BillingState();
}
class _BillingState extends State<Billing> {
  TextEditingController _itemController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  void clearafter(){
    _itemController.clear();
    _priceController.clear();
  }
  List<Product> products=[];
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
                var prod=Product(_itemController.value.text, _priceController.value.text);
                products.add(prod);
                clearafter();
                Navigator.of(context).pop();
                }, child: Text("Save"))
              ],
            )
          ),
          isScrollControlled: true//important
          );
            },
            child: Icon(Icons.add),),
          body: Container(
            padding: EdgeInsets.all(20),
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
              child:ListView.builder(itemBuilder:(context,index){
               return Center(child: Row(
                 mainAxisAlignment:MainAxisAlignment.spaceBetween,
                 children:[
                   Text(products[index].name,style: TextStyle(fontSize:30)),
                   Text(products[index].price,style: TextStyle(fontSize:30))
                 ]
               ));
              },itemCount: products.length,
            )
          ));
  }
}