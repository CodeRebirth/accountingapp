import 'package:accountingapp/widgets/postCarousal.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
@override
  void initState() {
    _pageController = PageController(initialPage: 0,viewportFraction: 0.7);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
            
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PostCarousal(_pageController)
         ],
),
),
);
}
}

