// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class Complaints extends StatefulWidget {
//   const Complaints({Key? key}) : super(key: key);

//   @override
//   _ComplaintsState createState() => _ComplaintsState();
// }

// class _ComplaintsState extends State<Complaints> {
//   late String value = '';

//   final Stream<QuerySnapshot> complaintdata =
//       FirebaseFirestore.instance.collection("complaints").snapshots();

//   deleteComplaint(item) {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection("complaints").doc(item);

//     documentReference
//         .delete()
//         .whenComplete(() => print("deleted successfully"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference complaint =
//         FirebaseFirestore.instance.collection("complaints");
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Complaints'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextFormField(
//                 onChanged: (val) {
//                   value = val;
//                 },
//                 decoration: const InputDecoration(
//                   hintText: 'Add complaints here',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Expanded(
//                 child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.white,
//                     child: StreamBuilder<QuerySnapshot>(
//                         stream: complaintdata,
//                         builder: (
//                           BuildContext context,
//                           AsyncSnapshot<QuerySnapshot> snapshot,
//                         ) {
//                           if (snapshot.hasData) {
//                             final data = snapshot.requireData;
//                             return ListView.builder(
//                                 itemCount: data.size,
//                                 itemBuilder: (context, index) {
//                                   return Center(
//                                     child: ListTile(
//                                         title: Text(
//                                           "${data.docs[index]['complaints']}",
//                                           style: const TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                         trailing: IconButton(
//                                           icon: const Icon(Icons.delete),
//                                           color: Colors.red,
//                                           onPressed: () {},
//                                         )),
//                                   );
//                                 });
//                           } else {
//                             return const Text("Loading Data error");
//                           }
//                         })),
//               ),
//             ),
//           ]),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           value;
//           complaint
//               .add({"complaints": value})
//               .then((value) => print("Complaints added"))
//               .catchError((error) => print('Error in creating collection'));
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

class Complaints extends StatefulWidget {
  const Complaints({
    Key? key,
  }) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  List complaintsLists = List.empty();
  String title = "";
  String description = "";
  @override
  void initState() {
    super.initState();
    complaintsLists = ["Hello", "Hey There"];
  }

  createToDo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("complaints").doc(title);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("complaints").snapshots(),
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
