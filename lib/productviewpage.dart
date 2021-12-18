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
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: Image.asset("assets/images/BlackForest-Germany-GettyImages-147180370.jpeg"))
      ],
    );
  }
}

