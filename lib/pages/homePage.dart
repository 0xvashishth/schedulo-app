// ignore_for_file: prefer_const_constructors
import 'package:schedulo/pages/dashBoard.dart';
import 'package:flutter/material.dart';
import 'package:schedulo/pages/profile.dart';
import 'package:schedulo/pages/profilePage.dart';
import 'package:schedulo/pages/updates.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Updates(),
    DashBoard(),
    // Profile(),
    ProfilePage1(),
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse_sharp),
              label: 'Updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard_sharp),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Colors.blue[700],
          onTap: _onItemTapped,
          elevation: 0,
        ),
      ),
    );
  }
}
