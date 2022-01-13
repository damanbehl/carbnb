import 'package:flutter/material.dart';
import 'components/uility_ui.dart' as UUI;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constant.dart' as constant;
import 'components/order_history_elem.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _auth.currentUser == null
          ? const Center(
              child: Text("User not logged In"),
            )
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: constant.defaultColor,
                  ),
                  Positioned(
                      top: screenHeight * 0.05,
                      child: const UUI.TopText(text: "Order History")),
                  Positioned(
                    top: screenHeight * 0.15,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                          color: constant.whiteshade,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0))),
                      child: FutureBuilder<Map<String, dynamic>>(
                        future: getOrderHistory(),
                        builder: (BuildContext context,
                            AsyncSnapshot<Map<String, dynamic>> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            default:
                              if (snapshot.hasError) {
                                return Text(
                                  'Error: ${snapshot.error}',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                );
                              } else {
                                return snapshot.data!["not_found"] != null
                                    ? const Center(
                                        child: Text(
                                            "You have no previous order history"),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            snapshot.data!["orders"].length,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return OrderHistoryElem(
                                              orderElem: snapshot
                                                  .data!["orders"][index]);
                                        },
                                      );
                              }
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<Map<String, dynamic>> getOrderHistory() async {
    var returnValue;
    try {
      await FirebaseFirestore.instance
          .collection("orders")
          .doc(_auth.currentUser!.email.toString())
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          returnValue = documentSnapshot.data();
        } else {
          returnValue = {"not_found": true};
        }
      });
      return returnValue;
    } catch (e) {
      rethrow;
    }
  }
}
