// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print
import 'package:brewapp/Screens/Home/HomeUISections/Payment.dart';
import 'package:brewapp/Screens/Home/HomeUISections/chat.dart';
import 'package:brewapp/Screens/Home/HomeUISections/complaint.dart';
import 'package:brewapp/Screens/Home/HomeUISections/electricity.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// import '../HomeUISections/profile.dart';

class Widget1 extends StatefulWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  _Widget1State createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
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
                      lastDay: DateTime(2050))
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 179, 179, 218),
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
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
                    color: Color(0xFF363740),
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
                        Icon(Icons.electrical_services,
                            size: 50, color: Colors.white),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Electricity Bills",
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
                      MaterialPageRoute(builder: (context) => Electricity()));
                },
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF363740),
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
              onTap: () {
                Navigator.push(
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
                    color: Color(0xFF363740),
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Complaints()));
                },
              ),
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF363740),
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
                        "Chat Here",
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chat()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
