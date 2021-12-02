import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(carbnb());
}

class carbnb extends StatefulWidget {
  const carbnb({Key? key}) : super(key: key);

  @override
  _carbnbState createState() => _carbnbState();
}

class _carbnbState extends State<carbnb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expanded(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/splashBg.png'))),
          child: Scaffold(
            backgroundColor: Color(0xff021127),
            body: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Car Booking',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 20.0),
                        child: ElevatedButton(
                            onPressed: () {
                              print('hello');
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(275, 50)),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ))),
                    Container(
                        margin: EdgeInsets.fromLTRB(35, 20, 35, 50),
                        color: Color(0xFF2A2E32),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Sign Up',
                              style: TextStyle(fontSize: 20, letterSpacing: 2)),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(275.0, 50.0),
                              primary: Color(0xff272A2E)),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(35, 70, 35, 0),
                        child: ElevatedButton(
                            onPressed: () {
                              print('facebook');
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'SignIn with  ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  children: const <TextSpan>[
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
                            )))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
