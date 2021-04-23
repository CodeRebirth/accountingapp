import 'package:accountingapp/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            return ListTile(
            onTap: (){
              Navigator.of(context).pushNamed("billViewer");
            },
            leading: Text('$index'),
            title:Text(key[index])
            );
          }
        )
      ):Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),))
    );
  }
}