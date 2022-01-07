import 'package:carbnb/logingpageform.dart';
import 'package:carbnb/paymentmethod.dart';
import 'package:carbnb/news_page.dart';
import 'package:flutter/material.dart';
import 'login_splash.dart';
import 'login_page.dart';
import 'constant.dart' as constant;
import 'home_screen.dart';
import 'paymentconformation.dart';
import 'insurance_page.dart';
import 'product_page.dart';
import 'user_profile.dart';
import 'main_home_page.dart';
import 'car_insurance_details.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const MainHomePage(),
        '/newsPage': (context) => const NewsPage(),
        '/search': (context) => const HomeScreen(),
        '/splash': (context) => const carbnb(),
        '/login': (context) => const LoginPage(),
        '/paymentConfirmation': (context) => const PaymentConfirmation(),
        '/insurancePage': (context) => const InsurancePage(),
        '/signup': (context) => const logingpageform(),
        '/paymentmethod': (context) => const paymentmethod(),
        '/productPage': (context) => const ProductPage(),
        '/userProfile': (context) => const UserProfile(),
        '/insuranceDetails': (context) => const CarInsuranceDescription(),
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
