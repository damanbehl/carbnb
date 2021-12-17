import 'package:carbnb/components/uility_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class productviewpage extends StatefulWidget {
  const productviewpage({Key? key}) : super(key: key);

  @override
  _productviewpageState createState() => _productviewpageState();
}

class _productviewpageState extends State<productviewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: defaultColor,
              child: Image(
                image: AssetImage(
                  'assets/images/BlackForest-Germany-GettyImages-147180370.jpeg',
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
