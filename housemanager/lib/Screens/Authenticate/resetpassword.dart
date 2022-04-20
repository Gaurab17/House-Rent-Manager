// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:brewapp/Screens/Services/constants.dart';
import 'package:brewapp/Screens/Services/loadingwid.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';

class Resetpsw extends StatefulWidget {
  const Resetpsw({Key? key}) : super(key: key);

  @override
  _ResetpswState createState() => _ResetpswState();
}

class _ResetpswState extends State<Resetpsw> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String hint = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Spinkit()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: backgroundColor,
              elevation: 0,
            ),
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/reset.gif",
                        height: 250,
                        width: 250,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: textColor),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 12),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter email' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your valid email ',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(buttonColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: buttonColor)))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth
                                .sendPasswordResetEmail(email: email)
                                .then((value) => null);

                            if (result == null) {
                              setState(() {
                                error = 'Enter valid data';
                                loading = false;
                              });
                            }
                            if (result != null) {
                              setState(() {
                                hint =
                                    'Check your email for the password reset link once you send request';
                              });
                            }
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          'Send Request',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 16)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(hint,
                          style: TextStyle(color: Colors.blue, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
