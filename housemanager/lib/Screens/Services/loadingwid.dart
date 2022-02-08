import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinkit extends StatelessWidget {
  const Spinkit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    );
  }
}
