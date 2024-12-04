import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/widgets/custom_botton.dart';
import 'package:k/widgets/custom_text_filed.dart';

class registerPage extends StatefulWidget {
  registerPage({super.key});
  static String id = 'registerPage';

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  bool validtionEmail = true, validtionPass = true, validtion = true;

  String? email, password, firstName, lastName, errorPass, errorEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60, top: 100),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    scale: 0.6,
                  ),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 4,
                        fontSize: 30),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                customTextField(
                  errorText: "Error in Name",
                  validtion: validtion,
                  onChanged: (Value) {
                    firstName = Value;
                  },
                  labelText: 'First Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                  validtion: validtion,
                  errorText: "Error in Name",
                  onChanged: (Value) {
                    lastName = Value;
                  },
                  labelText: 'Last Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                  validtion: validtionEmail,
                  onChanged: (value) {
                    email = value;
                  },
                  labelText: 'Email',
                  errorText: errorEmail,
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                  validtion: validtionPass,
                  onChanged: (value) {
                    password = value;
                  },
                  errorText: errorPass,
                  labelText: 'Password',
                ),
              ],
            ),
          ),
          customBotton(
            onTap: () async {
              if (firstName == null ||
                  lastName == null ||
                  firstName == "" ||
                  lastName == "") {
                showSnackMessage(context, 'you to have fill the names field');
                setState(() {
                  validtion = false;
                });
              } else {
                try {
                  await createUser();
                  showSnackMessage(context, 'success');
                  setState(() {
                    validtion = true;
                    validtionEmail = true;
                    validtionPass = true;
                    errorEmail = null;
                    errorPass = null;
                  });
                } on FirebaseAuthException catch (e) {
                  showSnackMessage(context, e.code);
                  setState(() {
                    if (e.code == "email-already-in-use" ||
                        e.message == "invalid-email") {
                      validtionEmail = false;
                      errorEmail = e.message;
                    }
                    if (e.code == "weak-password") {
                      validtionPass = false;
                      errorPass = e.message;
                    }
                  });
                }
              }
            },
            title: 'Register',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account ? ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showSnackMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> createUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
