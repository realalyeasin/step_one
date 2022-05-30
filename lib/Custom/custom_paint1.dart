import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5000000, size.height * 0.9000000);
    path0.lineTo(size.width * 0.2500000, size.height * 0.9000000);
    path0.lineTo(size.width * 0.2032000, size.height * 0.8962000);
    path0.lineTo(size.width * 0.0481000, size.height * 0.8959000);
    path0.lineTo(size.width * 0.0500000, size.height * 0.1000000);
    path0.lineTo(size.width * 0.7790500, size.height * 0.1096000);
    path0.lineTo(size.width * 0.9452500, size.height * 0.9000000);
    path0.lineTo(size.width * 0.5000000, size.height * 0.9000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
