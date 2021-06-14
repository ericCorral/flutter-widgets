import 'package:flutter/material.dart';

import 'package:layout_app/src/pages/animations_page.dart';
// import 'package:layout_app/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: HeaderSquare(),
      // body: HeaderDiagonal(),
      // body: HeaderTriangle(),
      // body: HeaderPeak(),
      // body: HeaderCurve(),
      // body: HeaderWaves(),
      // body: HeaderWavesGradient(),
      body: AnimationsPage(),
    );
  }
}
