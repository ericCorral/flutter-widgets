import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:layout_app/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      body: MySlideshow(),
      //  Column(
      //   children: [
      //     Expanded(
      //       child: MySlideshow(),
      //     ),
      //     Expanded(child: MySlideshow()),
      //   ],
      // ),
    );
  }
}

class MySlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimary: 18,
      bulletSecondary: 10,
      dotsHigh: false,
      dotsPrimaryColor: Colors.red,
      dotsSecondaryColor: Colors.black87,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        
      ],
    );
  }
}
