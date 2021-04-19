import 'package:flutter/material.dart';

class PostCarousal extends StatelessWidget{
  final List<String> _text=["Billing","Inventory","Scan"];
  final PageController _pageController;
  PostCarousal(this._pageController);
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.amber[200],
            child: PageView.builder(
            controller:_pageController,
            itemCount: 3,
            itemBuilder:(context,index){
          return  AnimatedBuilder(
            //animation is done here
          animation:_pageController,
          builder: (BuildContext context,Widget widget){
            double value = 1;
            if(_pageController.position.haveDimensions){
              value = _pageController.page - index;
              value = (1-(value.abs()*0.25)).clamp(0.0, 1.0);
            }
             return Center(
               child: SizedBox(
                 height:Curves.easeInOut.transform(value)*450.0,
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
                  offset: Offset(0, 3),
                  blurRadius: 6.0
                  ),
                  ]
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius:BorderRadius.circular(10)),
                child: Center(child: Text(_text[index],style: TextStyle(color: Colors.white,fontSize:40,fontFamily:"Philoshoper"),)),
              )
            ),
           
          ],
      ),
    );
  },
),
);
  }
}
