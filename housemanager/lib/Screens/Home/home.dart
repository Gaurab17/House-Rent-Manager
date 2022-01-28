// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf7ee),
      appBar: AppBar(
        title: const Text('Home Manager'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
        leading: const Icon(Icons.home),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.SignOut();
            },
            icon: Icon(Icons.logout),
            label: Text('Logout'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              height: 180,
              width: 400,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        height: 150,
                        width: 170,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                        ),
                        height: 150,
                        width: 170,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    height: 150,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    height: 150,
                    width: 170,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
