// ignore_for_file: file_names, unused_label, avoid_print
import 'package:brewapp/Screens/Models/user_model.dart';
import 'package:brewapp/Screens/Services/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

var globalVariable;

class KhaltiPaymentPage extends StatefulWidget {
  const KhaltiPaymentPage({Key? key}) : super(key: key);

  @override
  State<KhaltiPaymentPage> createState() => _KhaltiPaymentPageState();
}

class _KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
  TextEditingController amountController = TextEditingController();

  getAmt() {
    return int.parse(amountController.text) * 100; // Converting to paisa
  }

  var now = DateTime.now().toString().substring(0, 10);
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
    hidGenerate();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: topColor,
        title: const Text('Khalti Payment'),
        centerTitle: true,
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            Image.asset(
              "assets/images/khalti.gif",
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 15),
            // For Amount
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Enter Amount to pay",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            // For Button
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                color: buttonColor,
                child: const Text(
                  'Pay With Khalti',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                      amount: getAmt(),
                      productIdentity: 'dells-sssssg5-g5510-2021',
                      productName: 'Product Name',
                    ),
                    preferences: [
                      PaymentPreference.khalti,
                      PaymentPreference.connectIPS,
                    ],
                    onSuccess: (su) {
                      const successsnackBar = SnackBar(
                        content: Text('Payment Successful'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(successsnackBar);
                      FirebaseFirestore.instance
                          .collection("houseIDs")
                          .doc(globalVariable)
                          .collection('tenants')
                          .doc(loggedInUser!.uid)
                          .collection("history")
                          .add({
                            "payment date": now.toString(),
                            "payment history": (getAmt() / 100).toString(),
                          })
                          .then((value) => print("Payment Date added"))
                          .catchError(
                              (error) => print('Error in creating collection'));
                      FirebaseFirestore.instance
                          .collection("billings")
                          .doc(globalVariable)
                          .collection("bills")
                          .add({
                            "paid by": loggedInUser!.fullname,
                            "payment date": now.toString(),
                            "payment history": (getAmt() / 100).toString(),
                          })
                          .then((value) => print("Payment Date added"))
                          .catchError(
                              (error) => print('Error in creating collection'));
                    },
                    onFailure: (fa) {
                      const failedsnackBar = SnackBar(
                        content: Text('Payment Failed'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(failedsnackBar);
                    },
                    onCancel: () {
                      const cancelsnackBar = SnackBar(
                        content: Text('Payment Cancelled'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(cancelsnackBar);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
