// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print
import 'package:brewapp/Screens/Home/HomeUISections/Payment.dart';
import 'package:brewapp/Screens/Services/constants.dart';
import 'package:brewapp/Screens/Services/local_notification.dart';
// import 'package:brewapp/Screens/Home/HomeUISections/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:brewapp/Screens/Home/HomeUISections/chat.dart';
import 'package:brewapp/Screens/Home/HomeUISections/complaint.dart';
import 'package:brewapp/Screens/Home/HomeUISections/history.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:brewapp/Screens/chats/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:convert';

// import '../HomeUISections/profile.dart';

class Widget1 extends StatefulWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  _Widget1State createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  bool isLoading = false;

  storeNotificationToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection('customers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'token': token}, SetOptions(merge: true));
  }

  @override
  void initState() {
    // : implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.display(event);
    });
    storeNotificationToken();

    FirebaseMessaging.instance.subscribeToTopic('subscription');
  }

  sendNotification(String title, String token) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAAjIU2p00:APA91bEhi9qXI18VHvE9TRgp_GuUoKiQYO5nAkbG12mflbEaL10L8PFYN7gY3D9F0zywcEH5NDITLIw_8BD3ph_blKYn-R47UR6EWRCbYUbSqz0Lp6iRYsf9Bu07U50L2FtZDqHZw-Oj'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': 'You are followed by someone'
                },
                'priority': 'high',
                'data': data,
                'to': '$token'
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }

  sendNotificationToTopic(String title) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAAjIU2p00:APA91bEhi9qXI18VHvE9TRgp_GuUoKiQYO5nAkbG12mflbEaL10L8PFYN7gY3D9F0zywcEH5NDITLIw_8BD3ph_blKYn-R47UR6EWRCbYUbSqz0Lp6iRYsf9Bu07U50L2FtZDqHZw-Oj'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': 'You are followed by someone'
                },
                'priority': 'high',
                'data': data,
                'to': '/topics/subscription'
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                      calendarFormat: CalendarFormat.twoWeeks,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      headerStyle: const HeaderStyle(
                        headerPadding: EdgeInsets.symmetric(vertical: 1),
                        headerMargin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        titleCentered: true,
                        titleTextStyle:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                        decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        formatButtonTextStyle:
                            TextStyle(color: Colors.red, fontSize: 16.0),
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 28,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      weekendDays: [DateTime.saturday],
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        // Weekend days color (Sat,Sun)

                        weekendStyle: TextStyle(color: Colors.red),
                      ),
                      calendarStyle: const CalendarStyle(
                        // Weekend dates color (Sat & Sun Column)
                        weekendTextStyle:
                            TextStyle(color: Color.fromARGB(255, 51, 50, 50)),
                        // highlighted color for today
                        todayDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 54, 209, 7),
                          shape: BoxShape.circle,
                        ),
                        // highlighted color for selected day
                        selectedDecoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      )),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                boxShadow: [
                  //background color of box
                  BoxShadow(
                    color: Color.fromARGB(255, 112, 112, 112),
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Icon(Icons.history, size: 50, color: Colors.white),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "History",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History()));
                },
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2.3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Icon(Icons.monetization_on_rounded,
                          size: 50, color: Colors.white),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Pay Rent",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KhaltiPaymentPage()));
              },
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Icon(Icons.help_outline_rounded,
                            size: 50, color: Colors.white),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Complain Here",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Complaints()));
                },
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 2.3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Icon(Icons.chat_rounded, size: 50, color: Colors.white),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Group Chat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
