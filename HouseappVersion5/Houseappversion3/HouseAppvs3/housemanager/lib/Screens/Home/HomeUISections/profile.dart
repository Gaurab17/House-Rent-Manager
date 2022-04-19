
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
// import 'UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/profile.dart';
import 'package:brewapp/Screens/Home/UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/setting.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
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
    .collection("customers")
    .doc(customers!.uid)
    .get()
    .then((value){
      // this.loggedInUser = UserModel.fromMap(value.data());
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
     
      

    });
  }
  @override
  Widget build(BuildContext context) {

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

    Future uploadPic(BuildContext context) async{
      String fileName = basename(_image!.path);
      // StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      // StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("images/"+DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(File(_image!.path));
      uploadTask.then((res) {
  res.ref.getDownloadURL();
});
   
      
       setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
       });
    }

  
 
    return Scaffold(
      
        
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex:3,
                  child:Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // colors: [Colors.deepPurple[800],Colors.deepPurpleAccent],
                        colors:  [Colors.deepPurple,Colors.deepPurpleAccent]
                      ),
                    ),
                    child: Column(
                      children: [
                        
                        SizedBox(height: 20.0,),
                         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Color(0xff476cfb),
                        child: ClipOval(
                          child: new SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image!=null)?Image.file(
                              _image!,
                              fit: BoxFit.fill,
                            ):Image.asset("assets/images/users.png",
                              
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                     
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                         
                          size: 20.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                        
                          
                        
                        SizedBox(height: 10.0,),
                        Text("${loggedInUser.fullname}",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20.0,
                        )),
                        SizedBox(height: 10.0,),
                        Text("${loggedInUser.address}",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 15.0,
                        ),)
                    ]
                    ),
                  ),
                ),

                Expanded(
                  flex:5,
                  child: Container(
                    color: Colors.grey[200],
                    child: Center(
                        child:Card(
                            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: Container(
                            width: 350,
                            height:290.0,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Information",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w800,
                                  ),),
                                  Divider(color: Colors.grey[300],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.blueAccent[400],
                                        size: 35,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Mobile Number",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),),
                                          Text("${loggedInUser.mobilenumber}",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Email Address",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),),
                                          Text("${loggedInUser.email}",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("UserID",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),),
                                          Text("${loggedInUser.uid}",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      )

                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.blueAccent,
                                        size: 35,
                                      ),
                                      SizedBox(width: 20.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Landlord",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),),
                                          Text("Achyut Thapa",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      )

                                    ],
                                  ),
                                ],
                              ),
                            )
                          )
                        )
                      ),
                    ),
                ),

              ],
            ),
            Positioned(
                top:MediaQuery.of(context).size.height*0.27,
                left: 20.0,
                right: 20.0,
                child: Card(
                  child: Padding(
                    padding:EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            RaisedButton(
                              
                      color: Color(0xff476cfb),
                      onPressed: () {
                       uploadPic(context);
                      },
                                       
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'Update Profile',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                            
                            
                          ],

                        ),
                        
                      ],
                    ),
                  )
                )
            )
          ],

        ),
      ),
    );
  }
}