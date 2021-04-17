import 'package:accountingapp/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'screens/welcome.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.white),
          primaryColor: Colors.green[300],
          fontFamily: "Georgia",
          brightness: Brightness.light,
          shadowColor: Colors.grey,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 40,color: Colors.black)
          )
        ),
        initialRoute: "/",
        routes: {
          "/":(context)=> Welcome(),
          "homepage":(context)=>HomePage()
        },
      )
    );
  }
}
