// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:brewapp/Screens/Home/profile.dart';
import 'package:brewapp/Screens/Home/setting.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Settings()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Home Manager',
          style: TextStyle(color: Color(0xff212225)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
            color: Color(0xff212225),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            label: Text(''),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xff212225)),
              textTheme: TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.lightBlueAccent,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      const SizedBox(width: 8),
                      Text('Settings'),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      const SizedBox(width: 8),
                      Text('Profile'),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                    value: 2,
                    child: Row(children: [
                      TextButton.icon(
                        onPressed: () async {
                          await _auth.SignOut();
                        },
                        label: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.logout,
                          color: Color(0xff212225),
                        ),
                      ),
                    ]))
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Center(
                  child: Text(
                      'Something to show here like graph or recent tasks')),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:
                      Icon(Icons.emoji_objects, size: 50, color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2.3,
                child:
                    Icon(Icons.monetization_on, size: 50, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: GestureDetector(
                    child:
                        Icon(Icons.electric_car, size: 50, color: Colors.white),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2.3,
                child: Icon(Icons.chat, size: 50, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
