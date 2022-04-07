// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
import 'UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/profile.dart';
import 'package:brewapp/Screens/Home/UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/setting.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _currentIndex = 0;
  final tabs = [
    Center(child: Widget1()),
    Center(child: ProfileUI2()),
    // Center(child:Text("hello This is your Profile page")),
    // Center(child:Text("hello This is your Setting  page")),
    Center(child: SettingsApp()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Widget1(),

      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color.fromARGB(255, 52, 100, 204),
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        iconSize: 30,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text(
          'Home Manager',
          style: TextStyle(
              color: Color(
                0xff212225,
              ),
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(
            Icons.home,
            color: Color(0xff212225),
          ),
        ),
        actions: [
          TextButton.icon(
            // onPressed: () async {
            //   await _auth.SignOut();
            // },
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            label: Text(''),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
