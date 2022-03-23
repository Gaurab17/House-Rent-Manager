// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe, avoid_print

import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: KhaltiScope(
          publicKey: "your public key here",
          builder: (context, navigatorKey) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ne', 'NP'),
              ],
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              home: Container(
                child: SplashScreen(
                    seconds: 4,
                    navigateAfterSeconds: Wrapper(),
                    title: Text(
                      'Welcome to Home Manager',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    image: Image.asset(
                      'assets/images/home.jpg',
                      height: 250,
                      width: 250,
                    ),
                    backgroundColor: Colors.white,
                    styleTextUnderTheLoader: TextStyle(),
                    photoSize: 100.0,
                    onClick: () => print("Flutter "),
                    loaderColor: Colors.red),
              ),
            );
          }),
    );
  }
}
