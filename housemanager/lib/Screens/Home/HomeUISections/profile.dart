// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileUI2 extends StatelessWidget {
  final Stream<QuerySnapshot> users =
  FirebaseFirestore.instance.collection("users").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/home.jpg',
                  ),
                  fit: BoxFit.cover
                )
              ),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0,2.5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/users.png',
                  ),
                  radius: 60.0,
                ),
              ),
            ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Achyut Thapa"
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Aasthiskilo, Kavre"
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black87,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Joined This House: Jan 20,2022"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black87,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 40,
            ),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
            //   elevation: 2.0,
            //   child: Padding(
            //       padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
            //       child: Text("Skill Sets",style: TextStyle(
            //           letterSpacing: 2.0,
            //           fontWeight: FontWeight.w300
            //       ),))
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            Text(
              "Contact Me "
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
            ),
            ),
            // Card(
            //   margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Text("Project",
            //                 style: TextStyle(
            //                     color: Colors.blueAccent,
            //                     fontSize: 22.0,
            //                     fontWeight: FontWeight.w600
            //                 ),),
            //               SizedBox(
            //                 height: 7,
            //               ),
            //               Text("15",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 22.0,
            //                     fontWeight: FontWeight.w300
            //                 ),)
            //             ],
            //           ),
            //         ),
            //         Expanded(
            //           child:
            //           Column(
            //             children: [
            //               Text("Followers",
            //                 style: TextStyle(
            //                     color: Colors.blueAccent,
            //                     fontSize: 22.0,
            //                     fontWeight: FontWeight.w600
            //                 ),),
            //               SizedBox(
            //                 height: 7,
            //               ),
            //               Text("2000",
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 22.0,
            //                     fontWeight: FontWeight.w300
            //                 ),)
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
              ],
            )
          ],
        ),
      )
    );
  }
}

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final Stream<QuerySnapshot> users =
//       FirebaseFirestore.instance.collection("users").snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: MediaQuery.of(context).size.height / 1.3,
//         width: MediaQuery.of(context).size.width / 1.2,
//         color: Colors.green,
//         child: StreamBuilder<QuerySnapshot>(
//             stream: users,
//             builder: (
//               BuildContext context,
//               AsyncSnapshot<QuerySnapshot> snapshots,
//             ) {
//               if (snapshots.hasError) {
//                 return Text("Loading Data error");
//               } else {
//                 final data = snapshots.requireData;
//                 return ListView.builder(
//                     itemCount: data.size,
//                     itemBuilder: (context, index) {
//                       return Text("Gmail is ${data.docs[index]['gmail']}");
//                     });
//               }
//             }));
//   }
// }
