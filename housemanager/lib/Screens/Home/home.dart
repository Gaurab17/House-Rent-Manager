// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
import 'UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/profile.dart';
import 'package:brewapp/Screens/Home/UtiilsHome/homeButtonsWidget.dart';
import 'package:brewapp/Screens/Home/HomeUISections/setting.dart';
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:brewapp/Screens/Home/HomeUISections/all_users.dart';
import 'package:brewapp/Screens/Home/HomeUISections/notifications_list.dart';
import 'package:brewapp/Screens/Home/HomeUISections/notifications_main.dart';
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  User? customers = FirebaseAuth.instance.currentUser;
  
  
  UserModel loggedInUser = UserModel();
  int _currentIndex = 0;

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
  final tabs =[
    Center(child:Widget1()),
    Center(child:Profile()),
    // Center(child:Text("hello This is your Profile page")),
    // Center(child:Text("hello This is your Setting  page")),
    Center(child:SettingsApp()),
    // Center(child:HomeScreen()),
    


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Widget1(),

      body:tabs[_currentIndex],
     
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_box_sharp),
          //   label: 'Users',
          // ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });

        },
      
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.blueAccent,
      iconSize: 30,
      ),
     
    
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        foregroundColor: Colors.blue,
        
        elevation: 0.0,
        title: const Text(
          'Home Manager',
          style: TextStyle(color: Color(0xff212225)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        leading: Icon(
          Icons.home,
          color: Color(0xff212225),
        ),
        actions: [
              
           
          //  TextButton.icon(
          //    onPressed: (){},
          //   icon: Icon(
          //     Icons.circle,
          //     color: Colors.green,
          //     size: 8,
          //   ),
          //   label: Text("${loggedInUser.fullname}",
          //   style: TextStyle(color: Colors.black,
          //   fontSize: 8),

            
            
          //   ),
          // ),
          TextButton.icon(
            
            icon:Icon(Icons.notifications,
            color: Colors.black
            ),
            label: Text(''),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessagingExampleApp()));
            },
           ),
        ],
      ),
     
     
    );
  }
}
