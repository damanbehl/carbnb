import 'package:flutter/material.dart';
import 'package:carbnb/news_page.dart';
import 'user_profile.dart';
import 'home_screen.dart';
import 'order_history.dart';
import 'constant.dart' as constant;

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    HomeScreen(),
    UserProfile(),
    OrderHistory()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
            backgroundColor: constant.defaultColor,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'User',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: 'Orders',
            backgroundColor: constant.defaultColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
