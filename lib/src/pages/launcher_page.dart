import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:layout_app/src/routes/routes.dart';
import 'package:layout_app/src/theme/themechanger.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layouts'),
        centerTitle: true,
      ),
      drawer: _MainMenu(),
      body: _OptionList(),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                // padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'EC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _OptionList()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: accentColor,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                    activeColor: accentColor,
                    value: appTheme.customTheme,
                    onChanged: (value) => appTheme.customTheme = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.accentColor,
        ),
        title: Text(pageRoutes[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => pageRoutes[i].page));
        },
      ),
    );
  }
}
