import 'package:flutter/material.dart';
import 'package:k/widgets/custom_text_filed.dart';

class registerPage extends StatelessWidget {
  const registerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(
            flex: 2,
          ),
          Center(
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
          Spacer(),
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
                  labelText: 'First Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                  labelText: 'Last Name',
                ),
                const SizedBox(
                  height: 15,
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
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                'Register',
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
                      fontSize: 16),
                ),
              ),
            ],
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
