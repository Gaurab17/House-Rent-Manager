// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Account'),
            subtitle: Text('Password and Security'),
            leading: Icon(Icons.account_box),
            onTap: () {},
          ),
          ListTile(
            title: Text('Information and policies'),
            subtitle: Text('Its description'),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
          // ListTile(
          //   title: Text('Logout'),
          //   leading: Icon(Icons.logout_rounded),
          //   onTap: () async {
          //     await _auth.SignOut();
          //   },
          // ),
        ],
      ),
    );
  }
}
