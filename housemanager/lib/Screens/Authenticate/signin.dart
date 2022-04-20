// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:brewapp/Screens/Authenticate/resetpassword.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/Services/constants.dart';
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
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Spinkit()
        : Scaffold(
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/rent.gif',
                          height: 300,
                          width: 300,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Login to Home Manager',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your email' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                              hintText: 'Enter your valid email ',
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
                              ? 'Enter characters more than 6'
                              : null,
                          obscureText: _obscureText,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility),
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  _toggle();
                                },
                              ),
                              hintText: 'Enter your password ',
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
                      SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: 45,
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
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: buttonColor)))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        child: Text(
                          'Click here',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                        onTap: () {
                          widget.toggleView();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
