import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> color = [Colors.green, Colors.blue, Colors.red, Colors.orange,Colors.black];
  PageController _pageController;
@override
  void initState() {
    _pageController = PageController(initialPage: 0,viewportFraction: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.amber,
            child: PageView.builder(
            controller:_pageController,
            itemCount: 10,
            itemBuilder:(context,index){
          return  AnimatedBuilder(
            //animation is done here
          animation: _pageController,
          builder: (BuildContext context,Widget widget){
            double value = 1;
            if(_pageController.position.haveDimensions){
              value = _pageController.page - index;
              value = (1-(value.abs()*0.25)).clamp(0.0, 1.0);
            }
             return Center(
               child: SizedBox(
                 height:Curves.easeInOut.transform(value)*500.0,
                 child: widget,
                 ),
              );
          },
          child: Stack(
            //put here for on top image details
          children:<Widget> [
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(color:Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0
                  ),
                  ]
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius:BorderRadius.circular(10)),
              )
            ),
          ],
      ),
    );
  },
),
)
],
),
);
}
}

