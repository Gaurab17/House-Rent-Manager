// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'package:brewapp/Screens/Services/constants.dart';
import 'package:flutter/material.dart';

// import "package:housechat/components/rounded_button.dart";

import 'package:brewapp/Screens/chats/chatscreen.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    // animation = ColorTween(begin: Colors.white, end: Colors.pink).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: const ChatScreen(),
          title: const Text(
            'Welcome to Home Manager Chat System',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: "Dosis"),
          ),
          image: Image.asset(
            'assets/images/chat.gif',
            height: 250,
            width: 250,
          ),
          backgroundColor: backgroundColor,
          styleTextUnderTheLoader: const TextStyle(),
          photoSize: 100.0,
          onClick: () => print("Flutter "),
          loaderColor: Colors.red),
    );
  }
}
