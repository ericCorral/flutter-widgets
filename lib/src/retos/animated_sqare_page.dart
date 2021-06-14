import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(child: _AnimatedSquare()),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare>
    with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moveRight;
  late Animation<double> moveTop;
  late Animation<double> moveLeft;
  late Animation<double> moveBottom;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    moveRight = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));

    moveTop = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moveLeft = Tween(
      begin: 0.0,
      end: -100.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moveBottom = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      print('status: ${controller.status}');

      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
    // Initialize All
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
        animation: controller,
        child: _Rectangle(),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(moveRight.value, moveTop.value),
            child: Transform.translate(
              offset: Offset(moveLeft.value, moveBottom.value),
              child: child,
            ),
          );
        });
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
