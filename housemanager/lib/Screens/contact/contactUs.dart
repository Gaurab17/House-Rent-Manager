import 'package:brewapp/Screens/Services/constants.dart';
import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ContactUs(
          cardColor: cardColor,
          textColor: Colors.teal.shade900,
          email: 'gaurabstha001@gmail.com',
          // logo: const AssetImage("assets/images/real.gif"),
          companyName: 'Flutter Guys',
          companyColor: const Color.fromARGB(255, 10, 105, 97),
          dividerThickness: 2,
          phoneNumber: '9860145121',
          githubUserName: 'gaurab17',
          linkedinURL: 'https://www.linkedin.com/in/gaurab-stha-099249216/',
          taglineColor: const Color.fromARGB(255, 12, 76, 71),
          tagLine: 'Connect With us',
          twitterHandle: 'Gaurab01579279',
          instagram: 'gaurabS_sth',
          facebookHandle: 'Gaurab Sth'),
    );
  }
}
