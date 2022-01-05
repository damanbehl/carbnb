import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: const Text('User Profile'),
          leading: const SizedBox(),
          appBar: AppBar(),
          actions: const []),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              child: const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.red,
              ),
            ),
            flex: 4,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, left: 120),
              color: Colors.red,
              child: Column(
                children: [
                  _getRowWidget(Icons.account_box_sharp, 'User Name'),
                  const SizedBox(
                    height: 20,
                  ),
                  _getRowWidget(Icons.mail, 'Email id'),
                  const SizedBox(
                    height: 20,
                  ),
                  _getRowWidget(Icons.phone_iphone, '+1 000 000 0000'),
                  const SizedBox(
                    height: 20,
                  ),
                  _getRowWidget(Icons.password, '********')
                ],
              ),
            ),
            flex: 6,
          )
        ],
      ),
    );
  }

  Widget _getRowWidget(IconData icon, String fieldName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          fieldName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}
