// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:brewapp/Screens/Services/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
late User loggedUser;
var globalVariable;

class ChatScreen extends StatefulWidget {
  static const id = "ChatScreen";

  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextEditingController = TextEditingController();
  String? messageText;

  final _auth = FirebaseAuth.instance;

  User? customers = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser = UserModel();

  hidGenerate() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("userDetails")
        .doc(customers!.uid)
        .get();

    print(snapshot.id);

    Map data = snapshot.data() as Map;

    globalVariable = data['hid'];
    print("baaka" + data['hid']);
    await FirebaseFirestore.instance
        .collection("houseIDs")
        .doc(globalVariable)
        .collection("tenants")
        .doc(customers!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.formMap(value.data());
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
    hidGenerate();
  }

  void getUserDetail() async {
    try {
      final createdUser = await _auth.currentUser;

      if (createdUser != null) {
        loggedUser = customers!;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: null,
        title: const Text(
          '⚡️House Chat',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: topColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreambuilderClass(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextEditingController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      messageTextEditingController.clear();
                      _firestore
                          .collection('houseIDs')
                          .doc(globalVariable)
                          .collection("messages")
                          .add({
                        'sender': loggedInUser!.email,
                        'text': messageText,
                        'time': FieldValue.serverTimestamp() //add this
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StreambuilderClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('houseIDs')
            .doc(globalVariable)
            .collection("messages")
            .orderBy('time', descending: false) //add this
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final messageTime = message.get('time') as Timestamp; //add this
            final currentUser = loggedUser.email;

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
              time: messageTime, //add this
            );

            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: ListView(
                reverse: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: messageBubbles),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  final String? text;
  final String? sender;
  final bool? isMe;
  final Timestamp? time; // add this

  const MessageBubble({Key? key, this.text, this.sender, this.isMe, this.time})
      : super(key: key); //add the variable  in this constructor
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ' $sender',
            //  ${DateTime.fromMillisecondsSinceEpoch(time.seconds * 1000)}',
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),

          //   ' $sender',
          // '${DateTime.fromMillisecondsSinceEpoch(time!.seconds * 1000)}',
          // add this only if you want to show the time along with the email. If you dont want this then don't add this DateTime thing

          Material(
            color: isMe! ? Colors.blueAccent : Colors.white,
            borderRadius: isMe!
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                text!,
                style: TextStyle(
                    fontSize: 20, color: isMe! ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
