// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, non_constant_identifier_names, must_be_immutable

import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();
  List<String> Something = [
    'Account and security',
    'Information',
    'About Us',
    'Logout'
  ];
  List<Icon> iconItems = [
    Icon(Icons.account_box),
    Icon(Icons.info),
    Icon(Icons.contact_page),
    Icon(Icons.logout)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Something.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(Something[index]),
              leading: iconItems[index],
            );
          }),
    );
  }
}
