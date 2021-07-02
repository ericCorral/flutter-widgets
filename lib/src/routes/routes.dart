import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:layout_app/src/labs/slideshow_page.dart';
import 'package:layout_app/src/pages/animations_page.dart';
import 'package:layout_app/src/pages/circular_graphics_page.dart';
import 'package:layout_app/src/pages/emergency_page.dart';
import 'package:layout_app/src/pages/headers_page.dart';
import 'package:layout_app/src/pages/pinterest_page.dart';
import 'package:layout_app/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Square', AnimationsPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Bar', CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
