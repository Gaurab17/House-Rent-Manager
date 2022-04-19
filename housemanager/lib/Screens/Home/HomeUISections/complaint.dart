

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
// import 'UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/profile.dart';
import 'package:brewapp/Screens/Home/UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/setting.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Complaints extends StatefulWidget {
  const Complaints({
    Key? key,
  }) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  int counter = 0;
  List complaintsLists = List.empty();
  String title = "";
  String description = "";
  


  createToDo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("complaints")
        .doc(title);
        // .orderBy('time', descending: false);
       

    Map<String, String> complaints = {
      "complaints": title,
      "description": description
    };

    documentReference
        .set(complaints)
        .whenComplete(() => print("Data stored successfully"));
  }

  deleteTodo(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("complaints").doc(item);

    documentReference
        .delete()
        .whenComplete(() => print("deleted successfully"));
  }
   User? customers = FirebaseAuth.instance.currentUser;
  
  
  UserModel loggedInUser = UserModel();

  @override
  void initState(){
    super.initState();
    
    
    FirebaseFirestore.instance
    .collection("customers")
    .doc(customers!.uid)
    .get()
    .then((value){
      // this.loggedInUser = UserModel.fromMap(value.data());
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
     
      

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Complain Page",
        style: TextStyle(
          fontFamily: "Dosis",
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("customers").doc(loggedInUser.uid).collection("complaints").snapshots(),
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
                                //complaintsLists.removeAt(index);
                                deleteTodo((documentSnapshot != null)
                                    ? (documentSnapshot["complaints"])
                                    : "");
                              });
                            },
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
