// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, empty_statements, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable

// import 'package:brewapp/Screens/Authenticate/signin.dart';
import 'package:async_textformfield/async_textformfield.dart';
import 'package:brewapp/Screens/Home/home.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:brewapp/Screens/Services/constants.dart';
// import 'package:brewapp/Screens/Services/auth.dart';
import 'package:brewapp/Screens/Services/loadingwid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool _hidExist = false;

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

  // String houseID = '';
  // String password = '';
  // String username = '';
  String error = '';
  // Type contact = int;
  bool loading = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<dynamic> doesNameAlreadyExist(String hid) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('HouseNo')
        .where('hid', isEqualTo: hid)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.length == 1;
  }

  Future<bool> checkUserValue(String hid) async {
    await doesNameAlreadyExist(hid).then((help) {
      if (!help) {
        print("House ID doesn't Exist");
        _hidExist = help;
      } else {
        print("House id Available");
        _hidExist = help;
      }
    });
    return _hidExist;
  }

  // void test() async {
  //   QuerySnapshot firebasedata =
  //       await FirebaseFirestore.instance.collection("houseIDs").get();

  //   var firelist = firebasedata.docs.map((e) => e.id).toList();
  //   print(firelist);
  // }

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
                      Center(
                        child: Image.asset(
                          'assets/images/rent.gif',
                          height: 180,
                          width: 180,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Text(
                          "Register To House Manager",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, right: 22),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 106.0, right: 112),
                          child: AsyncTextFormField(
                            validationDebounce: Duration(milliseconds: 500),
                            valueIsEmptyMessage: "Enter valid house ID",
                            validator: checkUserValue,
                            hintText: "Enter House Id",
                            controller: houseIdEditingController,
                            isValidatingMessage:
                                'Comparing with the hash IDs from a secure server..',
                            valueIsInvalidMessage: 'Nope, Try Correct ID..',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
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
                              hintText: 'Enter Your Full Name ',
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
                              hintText: 'Enter valid email ',
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
                          validator: (val) => val!.isEmpty
                              ? 'Enter your mobile number'
                              : val.length < 10
                                  ? "Enter mobile no with length of 10"
                                  : val.length > 10
                                      ? "Enter mobile no with length of 10"
                                      : null,
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
                          obscureText: _obscureText,
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
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility),
                                highlightColor: Colors.pink,
                                onPressed: () {
                                  _toggle();
                                },
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
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
                              color: textColor,
                            ),
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
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()});
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Color.fromARGB(255, 235, 98, 86),
              content: Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Text(
                  "Password Provided is too Weak",
                  style: TextStyle(fontSize: 18.0, color: textColor),
                ),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: cardColor,
              content: Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Text(
                  "Account Already exists",
                  style: TextStyle(fontSize: 18.0, color: Colors.red),
                ),
              ),
            ),
          );
        }
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.hid = houseIdEditingController.text;
    userModel.fullname = fulllnameEditingController.text;
    userModel.address = addressEditingController.text;
    userModel.mobilenumber = mobilenumberEditingController.text;
    await firebaseFirestore
        .collection("houseIDs")
        .doc(userModel.hid)
        .collection("tenants")
        .doc(userModel.uid)
        .set(userModel.toMap());
    await FirebaseFirestore.instance
        .collection("userDetails")
        .doc(userModel.uid)
        .set(userModel.toMap());
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
