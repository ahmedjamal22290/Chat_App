import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/screens/register_page.dart';
import 'package:k/widgets/custom_text_filed.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  static String id = 'logInPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80, top: 100),
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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                customTextField(
                  labelText: 'Email',
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                  labelText: 'Password',
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25.0, left: 10, right: 5, bottom: 5),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Pacifico',
                ),
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "don't have an account ? ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, registerPage.id);
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                      fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
