// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;

  int counter = 0;
  // final AuthService _auth = AuthService();
  User? customers = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("userDetails")
        .doc(customers!.uid)
        .get()
        .then((value) {
      // this.loggedInUser = UserModel.fromMap(value.data());
      loggedInUser = UserModel.formMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Future getImage() async {
      ImagePicker picker = ImagePicker();
      // var image = await ImagePicker.pickImage(source: ImageSource.gallery,
      // );
      var image = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        //
        _image = File(image!.path);
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image!.path);
      // StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      // StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child("images/" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(File(_image!.path));
      uploadTask.then((res) {
        res.ref.getDownloadURL();
      });

      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(
            const SnackBar(content: const Text('Profile Picture Uploaded')));
      });
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: const Color.fromARGB(255, 217, 229, 245)),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Column(
                children: [
                  Container(
                    height: height * 0.33,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 133, 149, 228),
                                      Color.fromARGB(255, 156, 186, 216),
                                    ],
                                    begin: FractionalOffset.bottomCenter,
                                    end: FractionalOffset.topCenter,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      "${loggedInUser.fullname}",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${loggedInUser.address}",
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 16, 15, 15),
                                        fontFamily: 'Nunito',
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 70,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt_rounded,
                                  color: Color.fromARGB(255, 62, 62, 62),
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  getImage();
                                },
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                    radius: 80,
                                    child: ClipOval(
                                      child: SizedBox(
                                        width: 180.0,
                                        height: 180.0,
                                        child: (_image != null)
                                            ? Image.file(
                                                _image!,
                                                width: innerWidth * 0.45,
                                                fit: BoxFit.fitWidth,
                                              )
                                            : Image.asset(
                                                "assets/images/users.png",
                                                width: innerWidth * 0.45,
                                                fit: BoxFit.fitWidth,
                                              ),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.4,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 133, 149, 228),
                          Color.fromARGB(255, 156, 186, 216),
                        ],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'About Me',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 22,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 5, 34, 57),
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    "${loggedInUser.mobilenumber}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 5, 34, 57),
                                size: 30,
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Email Address",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    "${loggedInUser.email}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 5, 34, 57),
                                size: 30,
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "UserID",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    "${loggedInUser.uid}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.home,
                                color: Color.fromARGB(255, 5, 34, 57),
                                size: 30,
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "House ID",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    "${loggedInUser.hid}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
