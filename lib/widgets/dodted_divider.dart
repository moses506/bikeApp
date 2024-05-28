import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {

  const DottedDivider({
    super.key,
    this.color = Colors.blue,
    this.height = 1.0,
    this.thickness = 1.0,
    this.dashLength = 5.0,
    this.dashGap = 3.0,
  });
  final Color color;
  final double height;
  final double thickness;
  final double dashLength;
  final double dashGap;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: DottedLinePainter(
          color: color,
          thickness: thickness,
          dashLength: dashLength,
          dashGap: dashGap,
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {

  DottedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.dashGap,
  });
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashGap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    final startY = size.height / 2;
    var currentX = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashLength, startY),
        paint,
      );
      currentX += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
