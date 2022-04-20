import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const defColor = Color(0xFF7676e8);
const topColor = Color.fromARGB(255, 90, 82, 211);
const bottombarColor = Color.fromARGB(255, 234, 236, 239);
const cardColor = Color.fromARGB(255, 156, 186, 216);
const backgroundColor = Color.fromARGB(255, 217, 229, 245);
const buttonColor = Color.fromARGB(255, 90, 83, 190);
const textColor = Color.fromARGB(255, 54, 53, 53);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const kTextFieldDecorator = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
