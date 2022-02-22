// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print
import 'package:brewapp/Screens/Home/HomeUISections/bottomnavigation.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
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
            onPressed: () async {
              await _auth.SignOut();
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.black,
            ),
            label: Text(''),
          ),
        ],
      ),
      body: Widget1(),
      bottomNavigationBar: BasicBottomNavBar(),
    );
  }
}
