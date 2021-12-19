import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: const Text('Car Insaurance Description'), leading: const SizedBox(), appBar: AppBar(), actions: const []),
      body: Column(
        children: [
          Expanded(child: Container()),
        ],
      ),
    );
  }
}