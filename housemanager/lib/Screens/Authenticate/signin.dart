// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:brewapp/Screens/Authenticate/resetpassword.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/Services/loadingwid.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Spinkit()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/home.jpg',
                          height: 250,
                          width: 250,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Login to Home Manager',
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
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter email' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Email ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Enter chars more than 6'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Password ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 230.0),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff7274db)),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Resetpsw()));
                          }),
                      SizedBox(height: 14),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.SignInWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Enter valid data';
                                  loading = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(error, style: TextStyle(color: Colors.red)),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Text(
                          'Sign In as Guest',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff7274db),
                          ),
                        ),
                        onTap: () async {
                          dynamic result = await _auth.SignInAnon();
                          if (result != null) {
                            print('Sign In success');
                            print(result.uid);
                          } else {
                            print('Error in anonymous signin');
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        child: Text(
                          "Doesn't have account? Sign up",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                        onTap: () {
                          widget.toggleView();
                        },
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
