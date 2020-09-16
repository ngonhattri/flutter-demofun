import 'package:demofun/page/BarcodePage.dart';
import 'package:demofun/page/GpsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Foundation.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIndex = 0;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    BarcodePage(),
    GpsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.photo_camera), title: Text("Barcode")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.location_solid), title: Text("GPS")),
          ]),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return BarcodePage();
                break;
              case 1:
                return GpsPage();
                break;
              default:
                return BarcodePage();
                break;
            }
          });
    }
    //Android Scafold
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // Body Where the content will be shown of each page index
        body: tabs[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: onTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt), title: Text("Barcode")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on), title: Text("GPS")),
            ]),
      );
    }
  }
}
