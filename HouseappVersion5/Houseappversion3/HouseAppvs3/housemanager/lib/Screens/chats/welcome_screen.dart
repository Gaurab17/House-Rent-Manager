import 'package:flutter/material.dart';


import "package:animated_text_kit/animated_text_kit.dart";
// import "package:housechat/components/rounded_button.dart";

import 'package:brewapp/Screens/chats/chatscreen.dart';


class WelcomeScreen extends StatefulWidget {
  
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller; 
  Animation? animation;
 
  @override
  void initState() {
    
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
      

    );
    // animation = ColorTween(begin: Colors.white, end: Colors.pink).animate(controller);
    controller.forward();
    controller.addListener(() { 
      setState(() {
        
      });

    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("Welcome to Chat",
        style: TextStyle(
          fontFamily: "Dosis",
          color: Colors.white,
          fontWeight: FontWeight.bold,

        ),
        )

      ),
      
      backgroundColor: Colors.white,
      body: Padding(
        
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag:'logo',
                  child: Container(
                    
                    child: Image.asset('assets/images/chat.gif',
                    
                    ),
                    // height: controller.value,
                    height:60.0,
                  ),
                  
                ),
                 AnimatedTextKit(
                   animatedTexts: [
                     TypewriterAnimatedText("Hi!! Let's Chat Here... ",
                      textStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 30.0,
                        fontFamily: "Dosis",
                        fontWeight: FontWeight.bold,
                        

                      ),
                      speed: const Duration(milliseconds: 100)
                      ),

                   ],
                   totalRepeatCount: 20,
                  
                  
                  
                ),
              ],
            ),
            
        
            SizedBox(
              height: 80.0,
            ),
           
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                    
                  ),
                  onPressed: (){
                    
                    Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.login,
                      size: 35,),
                      SizedBox(width:20,),

                      Text("Log with HouseApp Account",
                      style: TextStyle(
                        fontSize: 20.0
                      ),
                      )

                    ],
                  ),
                  
                  
                  // color: Colors.lightBlueAccent,
                
                 
                ),
              ],
            ),
            
          
          ],
        ),
      ),
    );
  }
}