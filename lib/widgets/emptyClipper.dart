import 'package:flutter/material.dart';

class EmptyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
     Path path = new Path();
     path.lineTo(0.0, size.height/2);
     var firstpoint = Offset(0,size.height/2);
     var controlpoint = Offset(size.width/2,size.height/2);
     var endpoint = Offset(size.width,size.height/3);
     path.quadraticBezierTo(controlpoint.dx, controlpoint.dy, firstpoint.dx,firstpoint.dy);
     path.quadraticBezierTo(controlpoint.dx, controlpoint.dy, endpoint.dx,endpoint.dy);
     path.lineTo(size.width,size.height/2);
     path.lineTo(size.width,0.0);
     path.close();
     return path;
    }
    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}