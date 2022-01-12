import 'package:carbnb/components/uility_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'constant.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class paymentmethod extends StatefulWidget {
  const paymentmethod({Key? key}) : super(key: key);

  @override
  _paymentmethodState createState() => _paymentmethodState();
}

class _paymentmethodState extends State<paymentmethod> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool cvvFocus = false;
  bool chipvisible = true;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var uuid = Uuid();
  var postObject = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: defaultColor,
              ),
              TopText(text: "Payment Method"),
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
                      FutureBuilder<String>(
                        future: getPrefPrice(), // async work
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Text('Loading....');
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
                                return Text('Total Price: ${snapshot.data}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold));
                              }
                          }
                        },
                      ),
                      CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        isChipVisible: chipvisible,
                        cvvCode: cvvCode,
                        showBackView: cvvFocus,
                        onCreditCardWidgetChange:
                            (CreditCardBrand creditCardBrand) {},
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              CreditCardForm(
                                formKey: formKey,
                                obscureCvv: true,
                                obscureNumber: true,
                                cardNumber: cardNumber,
                                cardHolderName: cardHolderName,
                                cvvCode: cvvCode,
                                isHolderNameVisible: true,
                                isCardNumberVisible: true,
                                isExpiryDateVisible: true,
                                expiryDate: expiryDate,
                                themeColor: Colors.blue,
                                textColor: Colors.black,
                                cardNumberDecoration: InputDecoration(
                                  labelText: 'Number',
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                ),
                                expiryDateDecoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  labelText: 'Expired Date',
                                  hintText: 'XX/XX',
                                ),
                                cvvCodeDecoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  labelText: 'CVV',
                                  hintText: 'XXX',
                                ),
                                cardHolderDecoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  labelText: 'Card Holder',
                                ),
                                onCreditCardModelChange:
                                    onCreditCardModelChange,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Glassmorphism',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Switch(
                                    value: useGlassMorphism,
                                    inactiveTrackColor: Colors.grey,
                                    activeColor: Colors.black,
                                    activeTrackColor: Colors.green,
                                    onChanged: (bool value) => setState(() {
                                      useGlassMorphism = value;
                                    }),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Card Image',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Switch(
                                    value: useBackgroundImage,
                                    inactiveTrackColor: Colors.grey,
                                    activeColor: Colors.white,
                                    activeTrackColor: Colors.green,
                                    onChanged: (bool value) => setState(() {
                                      useBackgroundImage = value;
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  primary: const Color(0xff1b447b),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  child: const Text(
                                    'Validate',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'halter',
                                      fontSize: 14,
                                      package: 'flutter_credit_card',
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    postObject = await preparePostObject();
                                    String email = _firebaseAuth
                                        .currentUser!.email
                                        .toString();
                                    bool userPresent =
                                        await checkIfDocExists(email, "orders");
                                    print(userPresent);
                                    var collectionRef = FirebaseFirestore
                                        .instance
                                        .collection('orders');
                                    if (userPresent) {
                                      await collectionRef.doc(email).update({
                                        'orders':
                                            FieldValue.arrayUnion([postObject])
                                      });
                                    } else {
                                      collectionRef.doc(email).set({
                                        "orders": [postObject]
                                      });
                                      print("adding for the first time");
                                    }
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove("product_id");
                                    prefs.remove("insurance_price");
                                    prefs.remove("car_price");
                                    prefs.remove("insurance_id");
                                    Navigator.pushReplacementNamed(
                                        context, '/paymentConfirmation',
                                        arguments: postObject);
                                    print('valid!');
                                  } else {
                                    print('invalid!');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getPrefPrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return getTotalPrice(prefs.get("insurance_price"), prefs.get("car_price"));
  }

  Future<Map<String, dynamic>> preparePostObject() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String car_id = prefs.get("product_id").toString();
    String insurance_id = prefs.get("insurance_id").toString();
    var postObject = {
      "car_id": car_id,
      "date_rented": DateTime.now(),
      "insurance_id": insurance_id,
      "total_price":
          getTotalPrice(prefs.get("insurance_price"), prefs.get("car_price")),
      "car_id_ref": getDocReference(car_id, "cars"),
      "insurance_id_ref": getDocReference(insurance_id, "insurance"),
      "credit_card": cardNumber,
      "credit_card_exp": expiryDate,
      "transaction_id": uuid.v1()
    };
    return postObject;
  }

  String getTotalPrice(Object? x, Object? y) {
    return (int.parse(x.toString()) + int.parse(y.toString())).toString();
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      cvvFocus = creditCardModel.isCvvFocused;
    });
  }
}
