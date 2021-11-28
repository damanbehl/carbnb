
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
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
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),color: Colors.blue,),height: 50,width: 275,
                    margin: EdgeInsets.fromLTRB(0.0, 170.0, 0.0, 0.0),
                    child: Center(child: ElevatedButton(onPressed: (){print('hello');},
                        style: ElevatedButton.styleFrom(fixedSize: Size(275, 50)),

                        child: Text('Login',style: TextStyle(
                          fontSize: 20,color: Colors.white,letterSpacing: 2,),
                        )))),
              ),
              Container(
                  margin: EdgeInsets.all(35.0),
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
                  margin: EdgeInsets.all(35.0),

                  child: ElevatedButton(onPressed: (){print('facebook');}, child:
                  RichText( text: TextSpan(text: 'SignIn with  ', style: TextStyle(color: Colors.black,fontSize: 20),
                  children: const<TextSpan>[
                    TextSpan(text: 'facebook',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                  ]),),
                    style:ElevatedButton.styleFrom(fixedSize: Size(275.0, 50.0),primary: Color(0xffF4F8FC),)


              ),
              ),],
          ),
        ),
      ),
    );
  }
}
