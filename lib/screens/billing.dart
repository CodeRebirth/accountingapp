import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../widgets/empty.dart';

class Billing extends StatefulWidget {
  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> with SingleTickerProviderStateMixin {
  
TextEditingController _itemController = new TextEditingController();
TextEditingController _priceController = new TextEditingController();

void clearafter() {
    _itemController.clear();
    _priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
  var prod = Provider.of<Products>(context);
  var products = prod.prod;

  void onsaved(){
    var item = Product(_itemController.value.text,_priceController.value.text);
    clearafter();
    prod.addProduct(item);
    Navigator.of(context).pop(); 
  }
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.green,
          elevation:0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon:Icon(Icons.save),onPressed: (){
                // ignore: unnecessary_null_comparison
                if(prod.products != null)
                prod.saved();
                setState(() {
                prod.products = [];
                });
              }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
             showModalBottomSheet(
                context: context,
                builder: (ctx) => Container(
                    height: 500,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType:TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Item Name",
                              labelStyle: TextStyle(color: Colors.black)),
                          controller: _itemController,
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType:TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Price",
                              labelStyle: TextStyle(color: Colors.black)),
                          //  onFieldSubmitted: 
                          controller: _priceController,
                          onFieldSubmitted: (_){onsaved();},
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green)),
                            onPressed:()
                            {
                              onsaved();
                            },
                            child: Text("Save"))
                      ],
                    )),
                isScrollControlled: true //important
                );
          },
          child: Icon(Icons.add),
        ),
        body: products.isEmpty?Empty():Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
            
            itemBuilder: (context, index) {
                return Card(
                          elevation: 3,
                          margin:EdgeInsets.all(5), 
                            child: ListTile(
                                horizontalTitleGap: 50,
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(
                                radius:30,
                                backgroundColor:Colors.green,
                                child: Padding(
                                  padding: EdgeInsets.all(1),
                                  child: FittedBox(child:Text('${products[index].price}',style: TextStyle(color: Colors.white,fontSize:20))
                                ),
                              )
                        ),
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("${products[index].name}",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30)
                          ),
                        ),
                        trailing: IconButton(icon:Icon(Icons.delete),onPressed:(){
                          prod.delete(index);
                        },),
                        ),
                );
              },
itemCount: products.length,
 )));
}
}
