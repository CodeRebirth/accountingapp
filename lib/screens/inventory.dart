import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/inventory.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  bool done = false;

  bool isInit = true;
  var items=[];
@override
  void initState() {
    super.initState();
  }
@override
  void didChangeDependencies() {
    if(isInit){
     var object=Provider.of<InvProducts>(context,listen:false);
     object.getAll().then(
       (value) => {items = object.getItems,
       if(mounted){
          setState(() {
        done = true;
      })}
       });
    }
    isInit=false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title:Text("Inventory",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.black))),
      body: done?SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Product id")),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:Text("Product name")),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:Text("price")),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:Text("qty"))
               ]),
              Container(
                height: MediaQuery.of(context).size.height*0.85,
                child: ListView.builder(
                itemCount: items.length, itemBuilder: (BuildContext context, int index) { 
                  return SizedBox(
                    height: 35,
                    child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(items[index].id)),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:Text(items[index].name)),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:Text(items[index].price)),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:Text(items[index].qty))
                    ],
                    ),
                  );
                 },
            ),
              ),
            ]
        ),
      ):Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green)))
    );
  }
}