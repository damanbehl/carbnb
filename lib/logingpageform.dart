import 'package:flutter/material.dart';
import 'constant.dart';
class logingpageform extends StatefulWidget {
  const logingpageform({Key? key}) : super(key: key);

  @override
  _logingpageformState createState() => _logingpageformState();
}

class _logingpageformState extends State<logingpageform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Registration'),
          backgroundColor: defaultColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                'Welcome,     ',
                style: TextStyle(fontSize: 60),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: ' Last Name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  print('submit');
                },
                child: Text('submit'),
              ),
            )
          ],
        ),
      );
  }
}
