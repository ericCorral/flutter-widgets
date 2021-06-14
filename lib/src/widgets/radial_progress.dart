import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;
  const RadialProgress(
      {required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryWidth = 10,
      this.secondaryWidth = 4});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final animationDifference = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MyRadialProgress(
                  (widget.percentage - animationDifference) +
                      (animationDifference * controller.value),
                  widget.primaryColor,
                  widget.secondaryColor,
                  widget.primaryWidth,
                  widget.secondaryWidth),
            ),
          );
        });
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;

  _MyRadialProgress(this.percentage, this.primaryColor, this.secondaryColor,
      this.secondaryWidth, this.primaryWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);
    final Gradient gradient = new LinearGradient(
        colors: [Color(0xffC012FF), Color(0xff6D05E8), Colors.red]);

    // Circle
    final paint = new Paint()
      ..strokeWidth = secondaryWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final paintArc = new Paint()
      ..strokeWidth = primaryWidth
      // ..color = primaryColor
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // parte que se debe de ir llenando
    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
