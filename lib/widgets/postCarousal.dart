import 'package:flutter/material.dart';
class PostCarousal extends StatefulWidget{
  @override
  _PostCarousalState createState() => _PostCarousalState();
}

class _PostCarousalState extends State<PostCarousal> {
  final imagesList=["assets/images/Billing.png","assets/images/Inventory.png","assets/images/Scan.png"];

  late PageController _pageController;
 void initState() {
    _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
    super.initState();
  }
  Widget build(BuildContext context) {
    return PageView.builder(
          controller:_pageController,
          itemCount: 3,
          itemBuilder:(context,index){
    return AnimatedBuilder(
            //animation is done here
          animation:_pageController,
          builder: (BuildContext context,Widget? widget){
          double value = 1;
            if(_pageController.position.haveDimensions){
              value = _pageController.page! - index;
              value = (1-(value.abs()*0.25)).clamp(0.0, 1.0);
            }
           return Center(
               child: SizedBox(
                 height:Curves.easeInOut.transform(value)*380.0,
                 child: widget,
                 ),
              );
          },
          child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
              onTap: (){
                      if(index == 0){
                      Navigator.of(context).pushNamed("billing");
                      }
                      else if(index == 1){
                      Navigator.of(context).pushNamed("inventory");
                      }
                      else if(index == 2){
                      Navigator.of(context).pushNamed("scanner");
                      }    
                    },
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(imagesList[index],fit:BoxFit.cover)
                    )),
            ),   
    );
  },
);}}
