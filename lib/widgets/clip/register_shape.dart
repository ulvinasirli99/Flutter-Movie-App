import 'package:flutter/material.dart';


class RegisterShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 70);

    var firstEndPoint = Offset(size.width * .5, size.height - 80.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 40.0);
    path.quadraticBezierTo(
        firstControlpoint.dx, firstControlpoint.dy, firstEndPoint.dx,
        firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height-5);
    var secondControlPoint = Offset(size.width * 0.75, size.height - 20);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx,
        secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;


}