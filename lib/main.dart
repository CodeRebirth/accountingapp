import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/auth.dart';
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
        ChangeNotifierProvider<Auth>(create: (ctx)=>Auth(),),
        ChangeNotifierProxyProvider<Auth,Products>(
          create: (ctx)=>Products(),
          update: (ctx,auth,previousProduct){
            previousProduct!.authtoken = auth.token;
            previousProduct.userID = auth.userId;
            return previousProduct;
          }
        ),
        ChangeNotifierProxyProvider<Auth,InvProducts>(
          create: (ctx)=>InvProducts(),
          update: (ctx,auth,previousProduct){
            previousProduct!.authtoken = auth.token;
            return previousProduct;
          }
        ),
        ],
        child: Consumer<Auth>(builder: (ctx,auth,_)=> MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
              fontFamily: "Georgia",
              shadowColor: Colors.grey,
              textTheme: TextTheme(
                headline1: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)
              )
            ),
            home:auth.isAuth?NavPage():Welcome(),
            routes: {
              "homepage":(context)=>HomePage(),
              "navpage":(context)=>NavPage(),
              "billing":(context)=>Billing(),
              "inventory":(context)=>Inventory(),
              "billViewer":(context)=>BillViewer(),
              "scanner":(context)=>Scanner()
            },
        ),
      ),
    );
  }
}
