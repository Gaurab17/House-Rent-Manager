// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  late String value = '';
  String description = '';
  var listTodo = [''];
  var listDiscription = [''];

  listToDo(String item) {
    setState(() {
      listTodo.add(item);
    });
  }

  decslistToDo(String item) {
    setState(() {
      listDiscription.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference complaint =
        FirebaseFirestore.instance.collection("complaints");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listTodo.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: (val) {
                        value = val;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Add Items here',
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text('${listTodo[index]}'),
                      tileColor: Colors.white,
                      trailing: const Icon(Icons.delete),
                    ),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          listToDo(value);
          complaint
              .add({"complaints": listTodo})
              .then((value) => print("Complaints added"))
              .catchError((error) => print('Error in creating collection'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
