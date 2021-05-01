import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/billing.dart';
import 'screens/navpage.dart';
import 'screens/scanner.dart';
import 'screens/welcome.dart';
import 'provider/products.dart';
import 'provider/inventory.dart';
import 'screens/billViewer.dart';
import 'screens/inventory.dart';
import 'screens/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [  
        ChangeNotifierProvider<Products>(create: (ctx)=>Products(),),
        ChangeNotifierProvider<InvProducts>(create: (ctx)=>InvProducts(),),
        ],
          child: (
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white),
            primaryColor: Colors.green[300],
            fontFamily: "Georgia",
            shadowColor: Colors.grey,
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)
            )
          ),
          initialRoute: "/",
          routes: {
            "/":(context)=> Welcome(),
            "homepage":(context)=>HomePage(),
            "navpage":(context)=>NavPage(),
            "billing":(context)=>Billing(),
            "inventory":(context)=>Inventory(),
            "billViewer":(context)=>BillViewer(),
            "scanner":(context)=>Scanner()
          },
        )
      ),
    );
  }
}
