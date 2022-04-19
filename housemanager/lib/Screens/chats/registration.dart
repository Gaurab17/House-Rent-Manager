// import 'package:housechat/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:housechat/services/global_method.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import "package:housechat/services/global_method.dart";

// class LoginScreen extends StatefulWidget {
//   static const id = "LoginScreen";
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _auth = FirebaseAuth.instance;
//   GlobalMethods _globalMethods = GlobalMethods();
//   String? email;
//   String? password;
//   bool showSpinner = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlueAccent,
//         leading: null,
//         title: Text("Welcome to Login Page",
//         style: TextStyle(fontWeight: FontWeight.bold,
//         fontFamily: "Dosis",
//         ),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Flexible(
//                 child: Hero(
//                   tag: 'logo',
//                   child: Container(
//                     height: 400.0,
//                     child: Image.asset('images/chat.gif'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 48.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   email = value;
                  
//                 },
//                 decoration: kTextFieldDecorator.copyWith(
//                   prefixIcon: Icon(Icons.email,color: Colors.red,),
//                   hintText: "Enter your email address"),
//               ),
//               SizedBox(
//                 height: 8.0,
//               ),
//               TextField(
//                 textAlign: TextAlign.center,
//                 obscureText: true,
//                 onChanged: (value) {
//                  password = value;
//                 },
//                 decoration:kTextFieldDecorator.copyWith(
//                   prefixIcon: Icon(Icons.lock,color:Colors.red),
//                   hintText: "Enter Your Password"),
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                 primary: Colors.lightBlueAccent,
                
//               ),
//                 onPressed: () {
//                   _signin('$email', '$password');
                
                  
                  
//                   // setState(() {
//                   //   showSpinner = true;
//                   // });
//                   // try{
//                   // final user = await _auth.signInWithEmailAndPassword(email: '$email', password: '$password');
                  
//                   // if (user != null){
//                   //   Navigator.pushNamed(context,ChatScreen.id);
//                   // }
//                   // setState(() {
//                   //   showSpinner = false;
//                   // });
//                   // }
//                   // catch(e){
//                   //   print(e);
//                   // }
      
//                 },
//                 child: Row(
//                   children: [
                     
//                   Icon(Icons.login,
//                   size: 35,
//                   ),
//                   SizedBox(width: 90,),

//                   Text("Log In",
//                   style: TextStyle(
//                     fontSize: 20.0,
//                   ),)
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//   }
//   _signin(String email, String password) async{
   
//     try{
//       await _auth.signInWithEmailAndPassword(email: '$email', password: '$password');
//       //sucess
//       Navigator.pushNamed(context,ChatScreen.id);

//     }
//     catch(error){
//       _globalMethods.authErrorHandle("$error.message",context);
//       print("$error.message");


//     }
   

     
//     }
//   }
