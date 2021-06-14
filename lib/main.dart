import 'package:flutter/material.dart';
import 'package:layout_app/src/pages/emergency_page.dart';

// import 'package:layout_app/src/pages/pinterest_page.dart';
// import 'package:layout_app/src/pages/slideshow_page.dart';
// import 'package:layout_app/src/labs/slideshow_page.dart';
// import 'package:layout_app/src/pages/circular_graphics_page.dart';
// import 'package:layout_app/src/labs/circular_progress_page.dart';
// import 'package:layout_app/src/retos/animated_sqare_page.dart';
// import 'package:layout_app/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layouts App',
      debugShowCheckedModeBanner: false,
      // home: HeadersPage()
      // home: AnimatedSquarePage(),
      // home: CircularProgressPage(),
      // home: CircularGraphicsPage(),
      // home: SlideshowPage(),
      // home: SlideshowPage(),

      // home: PinterestPage(),
      home: EmergencyPage(),
    );
  }
}
