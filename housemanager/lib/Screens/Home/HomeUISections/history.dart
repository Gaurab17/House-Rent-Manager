// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:brewapp/Screens/Services/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var globalVariable;

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  CollectionReference history = FirebaseFirestore.instance
      .collection('houseIDs')
      .doc()
      .collection("tenants")
      .doc()
      .collection("history");

  User? customers = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser = UserModel();

  hidGenerate() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("userDetails")
        .doc(customers!.uid)
        .get();

    print(snapshot.id);

    Map data = snapshot.data() as Map;

    globalVariable = data['hid'];
    print("baaka" + data['hid']);
    await FirebaseFirestore.instance
        .collection("houseIDs")
        .doc(globalVariable)
        .collection("tenants")
        .doc(customers!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.formMap(value.data());
      setState(() {});
    });
  }

  void initState() {
    super.initState();
    hidGenerate();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment History"),
        centerTitle: true,
        backgroundColor: topColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: backgroundColor,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("houseIDs")
                .doc(globalVariable)
                .collection("tenants")
                .doc(loggedInUser!.uid)
                .collection("history")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print('Something went Wrong');
              } else if (snapshot.hasData) {
                final List storedocs = [];
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map a = document.data() as Map<String, dynamic>;
                  storedocs.add(a);
                  a["id"] = document.id;
                }).toList();

                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        1: FixedColumnWidth(180),
                        2: FixedColumnWidth(130),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                height: 50,
                                color: cardColor,
                                child: const Center(
                                  child: Text(
                                    'Payment Date',
                                    style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                height: 50,
                                color: cardColor,
                                child: const Center(
                                  child: Text(
                                    'Paid Amt',
                                    style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (var i = 0; i < storedocs.length; i++) ...[
                          TableRow(
                            children: [
                              Container(
                                height: 40,
                                color: Colors.white,
                                child: TableCell(
                                  child: Center(
                                      child: Text(storedocs[i]['payment date'],
                                          style:
                                              const TextStyle(fontSize: 20.0))),
                                ),
                              ),
                              Container(
                                height: 40,
                                color: Colors.white,
                                child: TableCell(
                                  child: Center(
                                      child: Text(
                                          storedocs[i]['payment history']
                                              .toString(),
                                          style:
                                              const TextStyle(fontSize: 20.0))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.red,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
