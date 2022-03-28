// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import "package:animated_text_kit/animated_text_kit.dart";
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
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Welcome to Chat",
            style: TextStyle(
              fontFamily: "Dosis",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      backgroundColor: Colors.white,
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
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: const TextStyle(),
          photoSize: 100.0,
          onClick: () => print("Flutter "),
          loaderColor: Colors.red),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       Row(
      //         children: <Widget>[
      //           Hero(
      //             tag: 'logo',
      //             child: SizedBox(
      //               child: Image.asset(
      //                 'assets/images/chat.gif',
      //               ),
      //               // height: controller.value,
      //               height: 60.0,
      //             ),
      //           ),
      //           AnimatedTextKit(
      //             animatedTexts: [
      //               TypewriterAnimatedText("Hi!! Let's Chat Here... ",
      //                   textStyle: const TextStyle(
      //                     color: Colors.redAccent,
      //                     fontSize: 30.0,
      //                     fontFamily: "Dosis",
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                   speed: const Duration(milliseconds: 100)),
      //             ],
      //             totalRepeatCount: 20,
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 80.0,
      //       ),

      // ],
    );
  }
}
