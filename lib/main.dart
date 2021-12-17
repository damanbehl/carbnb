import 'package:carbnb/logingpageform.dart';
import 'package:carbnb/paymentmethod.dart';
import 'package:flutter/material.dart';
import 'login_splash.dart';
import 'login_page.dart';
import 'paymentconformation.dart';
import 'productviewpage.dart';

void main() {
  // runApp(LoginPage());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent A Car',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const productviewpage(),
    );
  }
}
