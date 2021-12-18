import 'package:flutter/material.dart';

class ProductDetailTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: Row(
        children: const [
          Icon(Icons.arrow_back, color: Colors.white),
          Spacer(),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
