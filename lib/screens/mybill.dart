
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    if(mounted){
      setState(() {
      done = true;
    })
    }
    }
  );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: done?Container(
        color:Colors.white,
        height:MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: key.length,
          itemBuilder:(BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed("billViewer",arguments: key[index]);
              },
              child: Card(
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
                          child: Text(key[index],
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30)
                          ),),),
                ));
          }
        )
      ):Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),))
    );
  }
}