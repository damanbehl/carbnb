import 'package:carbnb/components/uility_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'productcontent.dart';
import 'constant.dart';
import 'productdetailtabbar.dart';

class productviewpage extends StatefulWidget {
  const productviewpage({Key? key}) : super(key: key);

  @override
  _productviewpageState createState() => _productviewpageState();
}

class _productviewpageState extends State<productviewpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ProductDetailTabBar(),
              productcontent(),
            ],
          ),
        ),

      ],
    );
  }
}



