import 'package:flutter/material.dart';

class NewCustomPainter extends CustomPainter {
  final Color color;

  NewCustomPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color // Use the provided color
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, const Color.fromARGB(255, 238, 236, 236), 15, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NewCustomPainter oldDelegate) {
    return oldDelegate.color != color; // Only repaint if color changes
  }
}
// import 'package:flutter/material.dart';

// // Custom Painter for the Bottom Navigation
// class NewCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = const Color.fromARGB(255, 2, 144, 187)
//       ..style = PaintingStyle.fill;

//     Path path = Path()..moveTo(0, 20);
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 20),
//         radius: const Radius.circular(10), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawShadow(path, const Color.fromARGB(255, 238, 236, 236), 15, true);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
