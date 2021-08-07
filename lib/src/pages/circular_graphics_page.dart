import 'package:flutter/material.dart';
import 'package:layout_app/src/theme/themechanger.dart';

import 'package:layout_app/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class CircularGraphicsPage extends StatefulWidget {
  @override
  _CircularGraphicsPageState createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              percentage += 10;
              if (percentage > 100) {
                percentage = 0.0;
              }
            });
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage,
                  color: Colors.blue,
                ),
                CustomRadialProgress(
                  percentage: percentage * 1.2,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                  percentage: percentage * 1.4,
                  color: Colors.purple,
                ),
                CustomRadialProgress(
                  percentage: percentage * 1.6,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({required this.percentage, required this.color});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: 180,
      height: 180,
      // color: Colors.blue,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: this.color,
        secondaryColor: appTheme.textTheme.bodyText1!.color!,
        primaryWidth: 12.0,
        secondaryWidth: 12.0,
      ),
    );
  }
}
