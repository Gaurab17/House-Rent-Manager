// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, non_constant_identifier_names, must_be_immutable, unused_field

import 'package:brewapp/Screens/Services/auth.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.white,
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout_rounded),
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
