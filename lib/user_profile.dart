import 'package:carbnb/components/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isLoggedIn = false;

  _signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  void initState() {
    print("initializing state in userprofile user status" +
        (_firebaseAuth.currentUser != null).toString());
    print(_firebaseAuth.currentUser);
    // uid = _firebaseAuth.currentUser!.uid.toString();
    // print(uid);
    setState(() {
      isLoggedIn = _firebaseAuth.currentUser != null;
    });
    print("Initializing isLoggedIn as> " + isLoggedIn.toString());
    super.initState();
  }

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
              padding: const EdgeInsets.only(top: 40, left: 20),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getRowWidget(
                      Icons.account_box_sharp,
                      (_firebaseAuth.currentUser != null
                          ? _firebaseAuth.currentUser!.uid
                          : "Not loggedin")),
                  const SizedBox(
                    height: 20,
                  ),
                  _getRowWidget(
                      Icons.mail,
                      (_firebaseAuth.currentUser != null
                          ? _firebaseAuth.currentUser!.email.toString()
                          : "Not loggedin")),
                  const SizedBox(
                    height: 20,
                  ),
                  _getRowWidget(Icons.phone_iphone, '+1 000 000 0000'),
                  const SizedBox(
                    height: 20,
                  ),
                  // _getRowWidget(Icons.password, '********')
                ],
              ),
            ),
            flex: 6,
          ),
          Expanded(
              child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.10,
            width: MediaQuery.of(context).size.width * 0.80,
            child: ElevatedButton(
              child: Text(isLoggedIn ? 'Logout' : 'Login'),
              onPressed: () async {
                print(isLoggedIn);
                if (!isLoggedIn) {
                  print("inside to navigate to login");
                  Navigator.pushNamed(context, "/login",
                      arguments: {"source": "profile_page"});
                } else {
                  await _signOut();
                  if (_firebaseAuth.currentUser == null) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', false);
                    Navigator.pushNamed(context, "/");
                  }
                }
              },
            ),
          ))
        ],
      ),
    );
  }

  Widget _getRowWidget(IconData icon, String fieldName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
        )
      ],
    );
  }
}
