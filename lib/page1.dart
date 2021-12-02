
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff021127),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/287755-grayscale-style 1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Car Booking',style: TextStyle(
                      fontSize: 50,color: Colors.white
                  ), ),
                ),

                Center(
                  child: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),color: Colors.blue,),height: 50,width: 275,
                     // margin: EdgeInsets.fromLTRB(0.0, 400.0, 0.0, 20.0),
                      child: Center(child: ElevatedButton(onPressed: (){print('login');
                      },
                          style: ElevatedButton.styleFrom(fixedSize: Size(275, 50)),

                          child: Text('Login',style: TextStyle(
                            fontSize: 20,color: Colors.white,letterSpacing: 2,),
                          )))),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(35, 20, 35, 50),
                    color: Color(0xFF2A2E32),
                    child: ElevatedButton(onPressed: (){}, child:Text('Sign Up',style: TextStyle(fontSize: 20,letterSpacing: 2)),
                      style:ElevatedButton.styleFrom(fixedSize: Size(275.0, 50.0),primary: Color(0xff272A2E)),)


                ),
                Divider(

                  height: 5,
                  color: Colors.white,
                  thickness: 0,
                  indent: 40,
                  endIndent: 40,


                ),

                Container(

                  margin: EdgeInsets.fromLTRB(35, 70, 35, 0),

                  child: ElevatedButton(onPressed: (){print('facebook');}, child:
                  RichText( text: TextSpan(text: 'SignIn with  ', style: TextStyle(color: Colors.black,fontSize: 20),
                      children: const<TextSpan>[
                        TextSpan(text: 'facebook',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                      ]),),
                      style:ElevatedButton.styleFrom(fixedSize: Size(275.0, 50.0),primary: Color(
                          0x72F5F5F6),)


                  ),
                ),],
            ),
          ),
        ),
      ),
    );
  }
}
