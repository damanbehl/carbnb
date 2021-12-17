import 'package:carbnb/logingpageform.dart';
import 'package:carbnb/news_page.dart';
import 'package:flutter/material.dart';
import 'login_splash.dart';
import 'login_page.dart';
import 'constant.dart' as constant;
import 'home_screen.dart';
import 'paymentconformation.dart';
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
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const NewsPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/search': (context) => const HomeScreen(),
        '/splash': (context) => const carbnb(),
        '/login' : (context) => const LoginPage(),
        '/paymentConfirmation': (context) => const PaymentConfirmation(),
        '/insurancePage': (context) => const InsurancePage(),
        '/signup' : (context) => const logingpageform(),


      },
      title: 'Rent A Car',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme:
            const ColorScheme.light().copyWith(primary: constant.defaultColor),
      ),
    );
  }
}
