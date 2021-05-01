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
       setState(() {
        done = true;
      })
       });
    }
    isInit=false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: done?Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
      ):Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),))
    );
  }
}