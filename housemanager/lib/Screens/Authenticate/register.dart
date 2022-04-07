// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, empty_statements, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable

// import 'package:brewapp/Screens/Authenticate/signin.dart';
import 'package:brewapp/Screens/Home/home.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
// import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/Services/loadingwid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final AuthService _auth = AuthService();
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final fulllnameEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final mobilenumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final houseIdEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  // String email = '';
  // String password = '';
  // String username = '';
  String error = '';
  // Type contact = int;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final fullnameField = TextFormField();
    final adddressField = TextFormField();
    final mobilenumberField = TextFormField();
    final emailField = TextFormField();
    final houseId = TextFormField();
    final passwordField = TextFormField();

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
                        height: 20,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/rent.gif',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Register to Home Manager!',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Dosis"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Full Name' : null,
                          onChanged: (val) {
                            setState(() {
                              fulllnameEditingController.text = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                              hintText: 'Enter your Full Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter House ID' : null,
                          onChanged: (val) {
                            setState(() {
                              houseIdEditingController.text = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.house,
                                color: Colors.red,
                              ),
                              hintText: 'Enter your House ID',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Your Valid Email' : null,
                          onChanged: (val) {
                            setState(() {
                              emailEditingController.text = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                              hintText: 'Email Your Valid Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your mobile number' : null,
                          onChanged: (val) {
                            setState(() {
                              mobilenumberEditingController.text = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.red,
                              ),
                              hintText: 'Mobile Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Address' : null,
                          onChanged: (val) {
                            setState(() {
                              addressEditingController.text = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: Colors.red,
                              ),
                              hintText: 'Your Address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Enter password with length more than 6'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              passwordEditingController.text = val;
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              hintText: 'Enter Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = signUp(
                                  emailEditingController.text,
                                  passwordEditingController.text);
                            }
                          }),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 8,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily: "Dosis"),
                          ),
                          GestureDetector(
                            child: Text(
                              'Click here',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue),
                            ),
                            onTap: () {
                              widget.toggleView();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()});
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;

    userModel.fullname = fulllnameEditingController.text;
    userModel.address = addressEditingController.text;
    userModel.mobilenumber = mobilenumberEditingController.text;
    await firebaseFirestore
        .collection("customers")
        .doc(user.uid)
        .set(userModel.toMap());
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
