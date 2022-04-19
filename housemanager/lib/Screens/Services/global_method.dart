import 'package:flutter/material.dart';

class GlobalMethods {
  Future<void>? authErrorHandle(String subtitle, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child:
                        Image.asset("images/error.png", height: 20, width: 20),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Error Occured"))
                ],
              ),
              content: Text(subtitle),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"),
                ),
              ],
            ));
    return null;
  }
}
