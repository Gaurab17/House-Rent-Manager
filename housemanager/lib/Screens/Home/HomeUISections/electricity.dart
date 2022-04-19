import 'package:flutter/material.dart';

class Electricity extends StatefulWidget {
  const Electricity({Key? key}) : super(key: key);

  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is electricity bill page"),
    );
  }
}
