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

import 'dart:async';



import 'package:flutter/foundation.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:brewapp/Screens/Home/HomeUISections/firebase_config.dart';
import 'package:brewapp/Screens/Home/HomeUISections/notifications_details.dart';

import 'package:brewapp/Screens/Home/HomeUISections/notifications_list.dart';






Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
    /// ToDO change your data ///
    options: const FirebaseOptions(
      apiKey:"AIzaSyBFiJaAE61GD_uXMHCTGf67BJUS_5SsIIU",
      appId: "1:603530372941:android:c164121dbce31411363904",
      messagingSenderId:'603530372941',
      projectId:"house-rent-manager",
    ),
  );

  
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  
  // Set the background messaging handler early on, as a named top-level function
 

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(const MessagingExampleApp());
}

/// Entry point for the example application.
class MessagingExampleApp extends StatelessWidget {
  const MessagingExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messaging Example App',
      theme: ThemeData.light(),
      routes: {
        '/': (context) =>const Application(),
        '/message': (context) => const MessageView(),
      },
    );
  }
}

/// Renders the example application.
class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void getToken() async {
    final token =
    _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }

  @override
  void initState() {
    super.initState();
    getToken();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          '/message',
          arguments: MessageArguments(message, true),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // channel.description,

              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        '/message',
        arguments: MessageArguments(message, true),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
        centerTitle: true,
        title: const Text('Push Notifications'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Notifications List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            MessageList(),
          ],
        ),
      ),
    );
  }
}