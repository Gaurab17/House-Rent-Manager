// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection("users").snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.width / 1.2,
        color: Colors.green,
        child: StreamBuilder<QuerySnapshot>(
            stream: users,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return Text("Loading Data error");
              } else {
                final data = snapshot.requireData;
                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Text("Gmail is ${data.docs[index]['gmail']}");
                    });
              }
            }));
  }
}
