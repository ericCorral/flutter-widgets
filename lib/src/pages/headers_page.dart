import 'package:flutter/material.dart';
import 'package:layout_app/src/theme/themechanger.dart';

import 'package:layout_app/src/widgets/headers.dart';
import 'package:provider/provider.dart';

import 'animations_page.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      // body: HeaderSquare(),
      // body: HeaderDiagonal(),
      // body: HeaderTriangle(),
      // body: HeaderPeak(),
      // body: HeaderCurve(),

      body: HeaderWaves(
        color: accentColor,
      ),
      // body: HeaderWavesGradient(),
      // body: AnimationsPage(),
    );
  }
}
