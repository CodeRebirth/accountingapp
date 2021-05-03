import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/inventory.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool fetch=false;
  bool match=false;
  var item;
  String _scanBarcode = 'Waiting';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      fetch=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              elevation: 0,
              title: const Text('Barcode scan')
              ),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow[900])),
                            onPressed: () => scanBarcodeNormal(),
                            child: Text('Start barcode scan')),
                        SizedBox(height: 25,),
                        Text('Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20)),
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow[900])),
                          onPressed:(){
                            if(fetch){
                             var obj= Provider.of<InvProducts>(context,listen:false);
                             obj.matchProduct(_scanBarcode).then((_)=>{
                               item= obj.fetchItem,
                              if(item != null){
                                setState(() {
                                match=true;
                              })
                              }
                             });
                            }
                            else return;
                          },
                          child: Text("Match"),
                          ),
                        Visibility(
                          visible: match?true:false,
                            child: Card(
                            elevation: 10,
                                child: Container(
                                height: MediaQuery.of(context).size.height*0.6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                ),
                                child:match?Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                 Text("ID: ${item.id}",style: TextStyle(fontSize:30)),
                                 SizedBox(height: 20,),
                                 Text("Name: ${item.name}",style: TextStyle(fontSize:30)),
                                 SizedBox(height: 20,),
                                 Text("Price: ${item.price}",style: TextStyle(fontSize:30)),
                                 SizedBox(height: 20,),
                                 Text("Qty: ${item.qty}",style: TextStyle(fontSize:30)),
                                 SizedBox(height: 20,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                  ElevatedButton(onPressed: null, child: Text("Add to Inventory")),
                                  ElevatedButton(onPressed: null, child: Text("Add to Bill"))
                                ],)
                                  ],):Text("Not matched"),
                                ),
                                ),
                        ),
                      ]));
            }));
  }
}