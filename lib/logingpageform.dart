import 'package:flutter/material.dart';

class logingpageform extends StatefulWidget {
  const logingpageform({Key? key}) : super(key: key);

  @override
  _logingpageformState createState() => _logingpageformState();
}

class _logingpageformState extends State<logingpageform> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme:AppBarTheme(backgroundColor: Color(
          0xff021127)),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,

        appBar: AppBar(
          title: Text('Registration'),
        ),

        body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Welcome,     '
                  ,style: TextStyle(fontSize: 60),),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(

                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: ' Last Name'
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(

                cursorColor: Colors.white,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as abc@gmail.com'
                ),
              ),
            ),
      Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter your secure password'
          ),
        ),
      ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter your secure password'
                ),
              ),
            ),
            Container(child: ElevatedButton(onPressed: () { print('submit'); }, child: Text('submit'),),)
          ],
        ),
      ),);
  }
}
