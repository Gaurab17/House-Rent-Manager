import 'package:brewapp/Screens/Services/constants.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: topColor,
        title: const Text(
          "About Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/gauri.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          const Expanded(
                            child: Text(
                              "Gaurab Shrestha",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Expanded(
                            child: Text(
                              "Email: gaurabstha001@gmail.com",
                              style: TextStyle(
                                fontFamily: "Dosis",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text("Contact: 9860145121"),
                          ),
                          const Expanded(
                            child: Text(
                              "Backend Developer",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 20),
              Expanded(
                  child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/achyut.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          const Expanded(
                            child: Text(
                              "Achyut Thapa",
                              style: TextStyle(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Expanded(
                            child: Text(
                              "Email: achyutthapa6@gmail.com",
                              style: TextStyle(
                                fontFamily: "Dosis",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text("Contact: 9861443780"),
                          ),
                          const Expanded(
                            child: Text(
                              "Backend Developer",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 20),
              Expanded(
                  child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/roj.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          const Expanded(
                            child: Text(
                              "Rojan Uprety",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: textColor),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Expanded(
                            child: Text(
                              "Email: rojan.uprety@gmail.com",
                              style: TextStyle(
                                fontFamily: "Dosis",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text("Contact: 9865382115"),
                          ),
                          const Expanded(
                            child: Text(
                              "UI/UX Developer",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 20),
              Expanded(
                  child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/kaji1.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          const Expanded(
                            child: Text(
                              "Aadarsha Thapa",
                              style: TextStyle(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Expanded(
                            child: Text(
                              "Email: aadarshaandkazi@gmail.com",
                              style: TextStyle(
                                fontFamily: "Dosis",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text("Contact: 9860040655"),
                          ),
                          const Expanded(
                            child: Text(
                              "UI/UX Developer",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 20),
              Expanded(
                  child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/kaley.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          const Expanded(
                            child: Text(
                              "Prajwol Manandhar",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Expanded(
                            child: Text(
                              "Email: p.mdr79@gmail.com",
                              style: TextStyle(
                                fontFamily: "Dosis",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text("Contact: 9843758344"),
                          ),
                          const Expanded(
                            child: Text(
                              "Manager ",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
