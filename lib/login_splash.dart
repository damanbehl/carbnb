import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class carbnb extends StatefulWidget {
  const carbnb({Key? key}) : super(key: key);

  @override
  _carbnbState createState() => _carbnbState();
}

class _carbnbState extends State<carbnb> {
  @override
  void initState() {
    print("inside init state for splash");
    checkIfLoggedIn();
    super.initState();
  }

  void checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(args["direction"]);
    if ((prefs.getBool('isLoggedIn') ?? false) &&
        args["direction"] == "forward") {
      Navigator.pushReplacementNamed(context, '/paymentmethod');
    } else if ((prefs.getBool('isLoggedIn') ?? false)) {
      print("was the insurance page pushed");
      Navigator.pushReplacementNamed(context, '/insurancePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff021127),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/splashBg.png'))),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Center(
                  child: Text(
                    'Car Booking',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login',
                                  arguments: {"source": "splash"});
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(275, 50)),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ))),
                    Container(
                        margin: EdgeInsets.all(10),
                        color: Color(0xFF2A2E32),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(fontSize: 20, letterSpacing: 2)),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(275.0, 50.0),
                              primary: Color(0xff272A2E)),
                        )),
                    // Container(
                    // child:
                    ElevatedButton(
                        onPressed: () {
                          print('facebook');
                        },
                        child: RichText(
                          text: const TextSpan(
                              text: 'SignIn with  ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'facebook',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(275.0, 50.0),
                          primary: Color(0xffF4F8FC),
                        ))
                    // )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
