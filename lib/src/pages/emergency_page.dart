import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout_app/src/widgets/fat_button.dart';

import 'package:layout_app/src/widgets/headers.dart';

class ItemButton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemButton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemButton>[
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF5)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasment',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF5)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasment',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF5)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasment',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemsMap = items
        .map((item) => FadeInLeft(
              child: FatButton(
                icon: item.icon,
                text: item.text,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  print('Hola');
                },
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 80,
                ),
                ...itemsMap
              ],
            ),
          ),
          _Header()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Medica',
          subtitle: 'Haz Solicitado',
          color2: Color(0xff66A9F2),
          color1: Color(0xff536CF6),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15.0),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  final itemsMap;

  const FatButtonTemp({
    this.itemsMap,
  });

  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.carCrash,
      text: 'Motor Accident',
      color1: Color(0xff6989f5),
      color2: Color(0xff906EF5),
      onPress: () {
        print('Click');
      },
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Haz Solicitado',
      title: 'Asistencia Medica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
