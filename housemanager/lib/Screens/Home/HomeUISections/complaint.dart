// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_string_interpolations, prefer_typing_uninitialized_variables
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:brewapp/Screens/Services/constants.dart';
import 'package:brewapp/Screens/chats/chatscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var globalVariable;

// final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Complaints extends StatefulWidget {
  const Complaints({
    Key? key,
  }) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  List complaintsLists = List.empty();
  List complaintsLists1 = List.empty();
  String title = "";
  String description = "";
  String globalHid = "";
  String? houseGlobe;

  // getGlobalHouseId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final counter = prefs.getInt('globalHouseID') ?? 100;
  //   globalHid = counter.toString();

  //   print('${counter.toString()} from complaint page');
  //   return counter.toString();
  // }

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

  createToDo() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("houseIDs")
        .doc(globalVariable)
        .collection("tenants")
        .doc(customers!.uid)
        .collection("complaints")
        .doc(title);

    Map<String, String> complaints = {
      "complaints": title,
      "description": description
    };

    documentReference
        .set(complaints)
        .whenComplete(() => print("Data stored successfully"));

    DocumentReference documentReference1 = FirebaseFirestore.instance
        .collection("complaints")
        .doc(globalVariable)
        .collection("complaints")
        .doc(title);

    Map<String, String> complaints1 = {
      "Complained By": loggedInUser!.fullname.toString(),
      "complaints": title,
      "description": description
    };

    documentReference1
        .set(complaints1)
        .whenComplete(() => print("Data stored successfully"));
  }

  deleteTodo(item) {
    DocumentReference delete = FirebaseFirestore.instance
        .collection("houseIDs")
        .doc(globalVariable)
        .collection("tenants")
        .doc(customers!.uid)
        .collection("complaints")
        .doc(item);

    delete.delete().whenComplete(() => print("deleted successfully"));

    DocumentReference documentReference1 = FirebaseFirestore.instance
        .collection("complaints")
        .doc(globalVariable)
        .collection("complaints")
        .doc(item);

    documentReference1
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }

  @override
  void initState() {
    super.initState();
    complaintsLists = ["Hello", "Hey There"];
    complaintsLists1 = ["Hello", "Hey There", "Hello"];
    hidGenerate();
  }

  Widget build(BuildContext context) {
    // getGlobalHouseId();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Complaints"),
        backgroundColor: topColor,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("houseIDs")
            .doc(globalVariable)
            .collection("tenants")
            .doc(loggedInUser!.uid)
            .collection("complaints")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                      snapshot.data?.docs[index];
                  return Dismissible(
                      key: Key(index.toString()),
                      child: Card(
                        elevation: 4,
                        child: Container(
                          color: bottombarColor,
                          child: ListTile(
                            title: Text((documentSnapshot != null)
                                ? (documentSnapshot["complaints"])
                                : ""),
                            subtitle: Text((documentSnapshot != null)
                                ? ((documentSnapshot["description"] != null)
                                    ? documentSnapshot["description"]
                                    : "")
                                : ""),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                setState(() {
                                  // complaintsLists.removeAt(index);
                                  deleteTodo((documentSnapshot != null)
                                      ? (documentSnapshot["complaints"])
                                      : "");
                                });
                              },
                            ),
                          ),
                        ),
                      ));
                });
          }
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Center(child: Text("Add complaints")),
                  content: SizedBox(
                    width: 400,
                    height: 120,
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                              hintText: 'Complaint Title'),
                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Complaint Description',
                          ),
                          onChanged: (String value) {
                            description = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            createToDo();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
