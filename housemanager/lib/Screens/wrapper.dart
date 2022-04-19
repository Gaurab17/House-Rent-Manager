// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_null_comparison, avoid_print

import 'package:brewapp/Screens/Authenticate/authenticate.dart';
// import 'package:brewapp/Screens/Authenticate/signin.dart';
import 'package:brewapp/Screens/Home/home.dart';
import 'package:brewapp/Screens/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserMod?>(context);
    //print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
