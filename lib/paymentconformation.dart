import 'package:carbnb/components/uility_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class PaymentConfirmation extends StatefulWidget {
  const PaymentConfirmation({Key? key}) : super(key: key);

  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: defaultColor,
            ),
            TopText(text: "Payment Done"),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: whiteshade,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      child: Icon(
                        Icons.assignment_turned_in_sharp,
                        color: Colors.white,
                        size: 50,
                      ),
                      backgroundColor: Color(0xFF47b881),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Payment Done Successfully',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Transaction id :' + args["transaction_id"]),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('executed on :' + args["date_rented"].toString()),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('car_id_ref :' + args["car_id"]),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (r) => false);
                        },
                        child: Text("Continue to Home"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
