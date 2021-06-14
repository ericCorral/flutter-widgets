import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  // Basic ingredients to create an animation
  // 1. Animation
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRight;
  late Animation<double> scaleBox;
  // 2. Animation Controller
  late AnimationController controller;

  //Life cicle of a StatefulWidget
  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    // Rotate the square
    rotation = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    // Applies opacity to the square
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeIn)));

    // opacityOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
    //     parent: controller, curve: Interval(0, 0.90, curve: Curves.easeIn)));

    // Translate square to the right
    moveRight = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    // Enlarge the square
    scaleBox = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    // Controller Event listener
    controller.addListener(() {
      // print('status: ${controller.status}');

      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
        // controller.repeat();
      }
      //  else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });
    super.initState();
  }

  @override
  void dispose() {
    // to avoid memory overflow
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play / Reproduccion
    // controller.repeat();
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? childRectangle) {
        // print('rotation: ' + rotation.value.toString());

        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                opacity: opacity.value - opacityOut.value,
                child: Transform.scale(
                    scale: scaleBox.value, child: childRectangle),
              )),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
