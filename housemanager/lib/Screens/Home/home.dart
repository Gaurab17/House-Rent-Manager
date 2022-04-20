// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, unused_field
import 'package:brewapp/Screens/Services/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/profile.dart';
import 'package:brewapp/Screens/Home/UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/setting.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:brewapp/Screens/Home/HomeUISections/notifications_main.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? customers = FirebaseAuth.instance.currentUser;
  final AuthService _auth = AuthService();

  UserModel loggedInUser = UserModel();
  int _currentIndex = 0;
  final tabs = [
    Center(child: Widget1()),
    Center(child: Profile()),
    Center(child: SettingsApp()),
  ];

  // geting houseId and storing it to global variable.
  validate() async {
    if (customers?.uid != null) {
      print(customers?.uid);

      CollectionReference houseIds =
          FirebaseFirestore.instance.collection('userDetails');
      var userHouseId = await houseIds.doc(customers!.uid).get().then((value) {
        Map data = value.data() as Map;
        print(data['hid']);
        return data['hid'];
      });

      // print("........ ${userHouseId} this is user house id ok?????");

    }
  }

  @override
  Widget build(BuildContext context) {
    validate();
    return Scaffold(
      // body: Widget1(),

      body: tabs[_currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 16),
        child: BottomNavigationBar(
          backgroundColor: bottombarColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 25,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: 'Settings',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.account_box_sharp),
            //   label: 'Users',
            // ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Color.fromARGB(255, 19, 86, 218),
          unselectedItemColor: Color.fromARGB(255, 2, 72, 81).withOpacity(0.5),
          iconSize: 30,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Color.fromARGB(255, 217, 229, 245),
      appBar: AppBar(
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: const Text(
            'Home Manager',
            style: TextStyle(
                color: Color(
                  0xff212225,
                ),
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: backgroundColor,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: Text(''),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MessagingExampleApp()));
            },
          ),
        ],
      ),
    );
  }
}
