import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(0.0,size.height/2);
    var firstpoint = Offset(0,size.height/2);
    var controlpoint = Offset(size.width/2,size.height);
    var endpoint = Offset(size.width,0.0);
    path.quadraticBezierTo(controlpoint.dx, controlpoint.dy, firstpoint.dx,firstpoint.dy);
    path.quadraticBezierTo(controlpoint.dx,controlpoint.dy,endpoint.dx,endpoint.dy);
    path.lineTo(size.width,0.0);
    path.lineTo(size.width,size.height);
    path.close();
    return path;
  }
  bool shouldReclip(CustomClipper oldClipper){
    return false;
  }
}