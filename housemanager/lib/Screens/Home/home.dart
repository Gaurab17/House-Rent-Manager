// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print
import 'package:brewapp/Screens/Home/HomeUISections/setting.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'HomeUISections/profile.dart';
import 'UtiilsHome/homeButtonsWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Home Manager',
          style: TextStyle(color: Color(0xff212225)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        leading: Icon(
          Icons.home,
          color: Color(0xff212225),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: Text(''),
          ),
        ],
      ),
      body: Widget1(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Color.fromARGB(255, 54, 149, 238),
            children: [
              SpeedDialChild(
                child: const Icon(Icons.face),
                label: 'profile',
                backgroundColor: Color.fromARGB(255, 80, 92, 248),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Color.fromARGB(255, 80, 92, 248),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.logout),
                label: 'Logout',
                backgroundColor: Color.fromARGB(255, 80, 92, 248),
                onTap: () async {
                  await _auth.SignOut();
                },
              ),
            ]),
      ),
    );
  }
}
