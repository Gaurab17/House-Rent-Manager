// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Complaint extends StatefulWidget {
  const Complaint({Key? key}) : super(key: key);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("This is complaint page"),
    );
  }
}
