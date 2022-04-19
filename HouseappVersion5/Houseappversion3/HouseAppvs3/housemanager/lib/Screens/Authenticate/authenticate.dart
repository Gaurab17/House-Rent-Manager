// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:brewapp/Screens/Authenticate/register.dart';
import 'package:brewapp/Screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool SignInView = true;
  void toggleview() {
    setState(() {
      SignInView = !SignInView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (SignInView) {
      return SignIn(toggleView: toggleview);
    } else {
      return Register(toggleView: toggleview);
    }
  }
}
