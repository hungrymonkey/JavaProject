
import 'package:flutter/material.dart';
import 'loader/asset_loader.dart';

buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(title: loadHomeBanner()),
          ListTile(
            title: Center( child: Text('Home')),
            onTap: () => { Navigator.pushReplacementNamed(context, '/')},
          ),
          ListTile(
            title: Center( child: Text('Map1')),
            onTap: () => { Navigator.pushReplacementNamed(context, '/map1')},
          ),
        ]
      )
    );
}

buildAppbar() {
  return AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(children: []),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black)
  );
}