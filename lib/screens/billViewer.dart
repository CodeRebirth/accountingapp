import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';


class BillViewer extends StatefulWidget {
  @override
  _BillViewerState createState() => _BillViewerState();
}

class _BillViewerState extends State<BillViewer> {
  var items=[];
  var isInit = true;
  var done = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() { 
    if(isInit){
    var id = ModalRoute.of(context)!.settings.arguments;   
    var object=Provider.of<Products>(context,listen:false);
    object.getitem(id).then((_) =>{
      items = object.fetchItems,
      if(mounted){
        setState(() {
        done = true;
      })
      }
    });
    }
    isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
    appBar: AppBar(centerTitle: true,
    backgroundColor: Colors.blue[900],
    title:Text("Bill Product",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.black))),
    body: done ? Container(
       color: Colors.white,
       child: ListView.builder( 
            itemBuilder: (context, index) {
                return Card(
                          elevation: 0,
                          margin:EdgeInsets.all(5), 
                            child: ListTile(
                                horizontalTitleGap: 50,
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(
                                radius:30,
                                backgroundColor:Colors.blue[900],
                                child: Padding(
                                  padding: EdgeInsets.all(1),
                                  child: FittedBox(child:Text('${items[index].price}',style: TextStyle(color: Colors.white,fontSize:20))
                                ),
                              )
                        ),
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("${items[index].name}",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30)
                          ),
                        ),
                        trailing: Icon(Icons.done),
                        ),
                );
              },
itemCount: items.length,
 ),
     ) :Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),)));
  }
}