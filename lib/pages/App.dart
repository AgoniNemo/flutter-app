import 'package:flutter/material.dart';
import 'Mine.dart';
import 'Home.dart';

class AppPage extends StatefulWidget {
  AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _index = 0;

  List<Widget> _homeWidgets = [
    HomePage(),
    MinePage(),
  ];

  void _onBottomNagigationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _homeWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onBottomNagigationBarTapped,
        items: [
          _getBottomNavItem('images/home.png', 'images/home_s.png', 0),
          _getBottomNavItem('images/me.png', 'images/me_s.png', 1),
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      icon: _index == index
          ? Image.asset(
              pressedIcon,
              width: 30,
              height: 30,
            )
          : Image.asset(
              normalIcon,
              width: 30,
              height: 30,
            ),
      label: '',
    );
  }
}
