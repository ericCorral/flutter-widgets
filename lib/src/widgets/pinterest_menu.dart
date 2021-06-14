import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor; // black
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.mostrar = true,
      this.activeColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.inactiveColor = Colors.blueGrey,
      required this.items});

  //  [
  //   PinterestButton(
  //       onPressed: () {
  //         print('pie_chart');
  //       },
  //       icon: Icons.pie_chart),
  //   PinterestButton(
  //       onPressed: () {
  //         print('search');
  //       },
  //       icon: Icons.search),
  //   PinterestButton(
  //       onPressed: () {
  //         print('notifications');
  //       },
  //       icon: Icons.notifications),
  //   PinterestButton(
  //       onPressed: () {
  //         print('supervised_user_circle');
  //       },
  //       icon: Icons.supervised_user_circle),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );

    // Another way to align menu at the centered bottom
    // return Column(
    // mainAxisAlignment: MainAxisAlignment.end,
    // children: [
    // Center(
    //   child: ChangeNotifierProvider(
    //     create: (_) => new _MenuModel(),
    //     child: _PinterestMenuBackground(
    //       child: AnimatedOpacity(
    //           duration: Duration(milliseconds: 250),
    //           opacity: (mostrar) ? 1 : 0,
    //           child: _MenuItems(items)),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 20.0,
    // )
    // ],
    // );
  }
}

// Widget to build the menu (colors, border, size)
class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

// Widget to build the items
class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButton(index, menuItems[index])));
  }
}

// widget to build the button items
class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelcted = Provider.of<_MenuModel>(context).itemSelected;
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSelcted == index) ? 35 : 25,
          color: (itemSelcted == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

// Model provider
class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color activeColor = Colors.black;
  Color backgroundColor = Colors.white;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }

  // Color get activeColor => this._activeColor;

  // set activeColor(Color color) {
  //   this._activeColor = color;
  //   notifyListeners();
  // }

  // Color get inactiveColor => this._inactiveColor;

  // set inactiveColor(Color color) {
  //   this._inactiveColor = color;
  //   notifyListeners();
  // }

  // Color get backgroundColor => this._backgroundColor;

  // set backgroundColor(Color color) {
  //   this._backgroundColor = color;
  //   notifyListeners();
  // }
}
