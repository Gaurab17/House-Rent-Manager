// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, non_constant_identifier_names, must_be_immutable, unused_field

import 'package:brewapp/Screens/Authenticate/resetpassword.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/Services/constants.dart';
import 'package:brewapp/Screens/contact/about_us.dart';
import 'package:brewapp/Screens/contact/contactUs.dart';
import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class SettingsApp extends StatelessWidget {
  final AuthService _auth = AuthService();
  List<String> Something = [
    'Account and security',
    'Information',
    'About Us',
  ];
  List<Icon> iconItems = [
    Icon(Icons.account_box),
    Icon(Icons.info),
    Icon(Icons.contact_page),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              color: backgroundColor,
              child: ListTile(
                title: Text("Account Password Reset"),
                leading: Icon(
                  Icons.password_rounded,
                  color: Colors.blue,
                ),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Resetpsw()));
                },
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              color: backgroundColor,
              child: ListTile(
                title: Text("About Us"),
                leading: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              color: backgroundColor,
              child: ListTile(
                title: Text("Contact Us"),
                leading: Icon(
                  Icons.contact_page,
                  color: Colors.blue,
                ),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contactus()));
                },
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              color: backgroundColor,
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.blue,
                ),
                onTap: () async {
                  await _auth.SignOut();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
