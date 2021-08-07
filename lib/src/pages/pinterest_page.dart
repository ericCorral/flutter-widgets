import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:layout_app/src/theme/themechanger.dart';
import 'package:layout_app/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider scope ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[PinterestGrid(), _PinterestMenuLocation()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final widthScreen = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context)._mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    // final accentColor = appTheme.currentTheme.accentColor;
    return Positioned(
      bottom: 30,
      child: PinterestMenu(
        mostrar: mostrar,
        items: [
          PinterestButton(
              onPressed: () {
                print('pie_chart');
              },
              icon: Icons.pie_chart),
          PinterestButton(
              onPressed: () {
                print('search');
              },
              icon: Icons.search),
          PinterestButton(
              onPressed: () {
                print('notifications');
              },
              icon: Icons.notifications),
          PinterestButton(
              onPressed: () {
                print('supervised_user_circle');
              },
              icon: Icons.supervised_user_circle),
        ],
        backgroundColor: appTheme.scaffoldBackgroundColor,
        activeColor: appTheme.accentColor,
        // inactiveColor: Colors.blue,
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double previusScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        // print('ScrollListener: ${controller.offset}');
        if (controller.offset > previusScroll && controller.offset > 150) {
          // print('ocultar menu');
          Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        } else {
          // print('mostrar menu');
          Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        }

        previusScroll = controller.offset;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

// Notification listeners
class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }
}
