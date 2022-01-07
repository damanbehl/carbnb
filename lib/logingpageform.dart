import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carbnb/components/uility_ui.dart' as UUI;

class logingpageform extends StatefulWidget {
  const logingpageform({Key? key}) : super(key: key);

  @override
  _logingpageformState createState() => _logingpageformState();
}

class _logingpageformState extends State<logingpageform> {
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  String name = "";
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Registration'),
          backgroundColor: defaultColor,
        ),
        body: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formkey,
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.light,
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 120),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Welcome',
                                  style: TextStyle(fontSize: 40),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (value) {
                                      name = value.toString().trim();
                                    },
                                    validator: (value) => (value!.isEmpty)
                                        ? ' Please enter name'
                                        : null,
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Name',
                                        hintText: 'Name'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.white,
                                    onChanged: (value) {
                                      email = value.toString().trim();
                                    },
                                    validator: (value) => (value!.isEmpty &&
                                            UUI.isEmailValid(value))
                                        ? ' Please enter a valid email'
                                        : null,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'email',
                                        hintText:
                                            'Enter valid mail id as abc@gmail.com'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty &&
                                          UUI.validatePssword(value)) {
                                        return "Please enter an alphanumeric 8 length Password";
                                      }
                                    },
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                        hintText: 'Enter your secure password'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty && value != password) {
                                        return "Your password does not match";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Confirm Password',
                                        hintText: 'Enter your secure password'),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await onRegister();
                                    Navigator.pushNamed(
                                        context, '/paymentmethod');
                                    print('submit');
                                  },
                                  child: const Text('submit'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ));
  }

  Future onRegister() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Successfully Registered. You can Login Now'),
          ),
          duration: Duration(seconds: 5),
        ));
        Navigator.of(context).pop();
        setState(() {
          isloading = false;
        });
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(' Ops! Registration failed'),
                  content: Text('${e.message}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Okay'),
                    )
                  ],
                ));
      }
      setState(() {
        isloading = false;
      });
    }
  }
}
