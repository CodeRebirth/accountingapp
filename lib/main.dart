
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/billing.dart';
import 'screens/navpage.dart';
import 'screens/welcome.dart';
import 'provider/products.dart';
import 'screens/billViewer.dart';
import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
         create:(ctx)=>Products(),
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
            "billViewer":(context)=>BillViewer()
          },
        )
      ),
    );
  }
}
