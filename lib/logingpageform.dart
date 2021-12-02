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
      theme: ThemeData(appBarTheme:AppBarTheme(backgroundColor: Color(0xff1A1F24)),
      ),
      home: Scaffold(
        backgroundColor: Color(0xff021127),

        appBar: AppBar(
          title: Text('Regist'),
        ),

        body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid mail id as abc@gmail.com'
                  ),
                ),

            ),
          ],
        ),
      ),);
  }
}
