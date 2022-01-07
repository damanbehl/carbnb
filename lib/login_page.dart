import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'components/uility_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool isFormValid = true;
  String email = "";
  String password = "";
  bool isEmailPristine = true;
  bool isPasswordPristine = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: defaultColor,
                    ),
                    const TopText(text: "Login"),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.10,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: whiteshade,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  topRight: Radius.circular(45))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.09),
                                child: Image.asset(
                                    "assets/images/starting_icon.png"),
                              ),
                              InputField(
                                headerText: "Email",
                                hintTexti: "Email",
                                textColor: Colors.black,
                                onChange: (value) {
                                  setState(() {
                                    isEmailPristine = false;
                                    email = value;
                                  });
                                },
                              ),
                              (!isEmailPristine && email.isEmpty)
                                  ? const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        'email cannot be empty',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 10,
                              ),
                              InputFieldPassword(
                                headerText: "Password",
                                hintTexti: "Atleast 9 characters",
                                textColor: Colors.black,
                                onChange: (value) {
                                  setState(() {
                                    isPasswordPristine = false;
                                    password = value;
                                  });
                                },
                              ),
                              (!isPasswordPristine && password.isEmpty)
                                  ? const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        'Password cannot be empty',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCheckBox(),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        //TODO FORGOT PASSWORD
                                      },
                                      child: Text("Forgot Pasword?",
                                          style: TextStyle(
                                              color:
                                                  defaultColor.withOpacity(0.7),
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () async {
                                  onLogin();
                                  print("inkwell");
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      color: defaultColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: whiteshade),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.149,
                                      top: MediaQuery.of(context).size.height *
                                          0.08),
                                  child: Text.rich(TextSpan(
                                      text: "If you don't have an account...",
                                      children: [
                                        TextSpan(
                                            text: "Sign up",
                                            style: TextStyle(
                                                color: defaultColor,
                                                fontSize: 16),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushReplacementNamed(
                                                    context, '/signup');
                                              })
                                      ],
                                      style: TextStyle(
                                          color: grayshade.withOpacity(0.8),
                                          fontSize: 16))))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
    );
  }

  Future onLogin() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      setState(() {
        isLoading = false;
      });
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.pushReplacementNamed(context, '/paymentmethod');
        setState(() {
          isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Ops! Login Failed"),
            content: Text('${e.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              )
            ],
          ),
        );
        print(e);
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
