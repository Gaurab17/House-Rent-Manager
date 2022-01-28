// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:brewapp/Screens/Services/loadingwid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Resetpsw extends StatefulWidget {
  const Resetpsw({Key? key}) : super(key: key);

  @override
  _ResetpswState createState() => _ResetpswState();
}

class _ResetpswState extends State<Resetpsw> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  // String hint = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Spinkit()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 12),
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email ',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
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
                            // } else if (result != null) {
                            //   setState(() {
                            //     hint =
                            //         'Check your email for the password reset link once you send request';
                            //   });
                          }
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Send Request',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Enter your email address to request a password reset. You will be redirected to login form if email is correct.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.blue[800]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Text(
                        'You will receive email with instructions.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.blue[800]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
