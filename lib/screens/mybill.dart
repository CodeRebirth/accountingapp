import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/tile.dart';
import '../provider/products.dart';

class MyBill extends StatefulWidget {
  @override
  _MyBillState createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> {
  var key=[];
  var done = false;
@override
  void initState() {
    super.initState();
  }
@override
  void didChangeDependencies() {
  var object = Provider.of<Products>(context,listen:false);
  object.getProducts().then((value) => {
    key = object.getkeys,
    setState(() {
      done = true;
    })
    }
  );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: done?Container(
        height:MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: key.length,
          itemBuilder:(BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed("billViewer");
              },
              child: Tile(index,key));
          }
        )
      ):Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),))
    );
  }
}