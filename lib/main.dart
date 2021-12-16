import 'package:carbnb/logingpageform.dart';
import 'package:carbnb/news_page.dart';
import 'package:flutter/material.dart';
import 'login_splash.dart';
import 'login_page.dart';
import 'constant.dart' as constant;
import 'home_screen.dart';
import 'home_screen.dart';
import 'insurance_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme:
            const ColorScheme.light().copyWith(primary: constant.defaultColor),
      ),
      home: const NewsPage(),
    );
  }
}
