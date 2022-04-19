// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, import_of_legacy_library_into_null_safe, avoid_print

import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:brewapp/Screens/services/local_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  /// On click listner
}
void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
          publicKey: "test_public_key_180e7f68d1014c72bfa8adfbf30f92ce",
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
                      'Welcome to Home Manager'
                      ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0,
                          fontFamily: "Dosis"
                          ),
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
