import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/screens/register_page.dart';
import 'package:k/widgets/custom_botton.dart';
import 'package:k/widgets/custom_text_filed.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});
  static String id = 'logInPage';

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool validtion = true;

  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
              child: Form(
                key: formKey,
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
                      onChanged: (value) {
                        email = value;
                      },
                      labelText: 'Email',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextField(
                      onChanged: (value) {
                        password = value;
                      },
                      labelText: 'Password',
                    ),
                  ],
                ),
              ),
            ),
            customBotton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await loginUser();
                    showSnackMessage(context, 'Success');
                  } on FirebaseAuthException catch (e) {
                    showSnackMessage(context, e.code);
                  } catch (ex) {
                    showSnackMessage(context, 'There was an Error');
                  }
                  setState(() {
                    isLoading = false;
                  });
                } else {}
              },
              title: 'Sign In',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account ? ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                navigatToRegisterPage(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector navigatToRegisterPage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, registerPage.id);
      },
      child: const Text(
        "Register",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
            fontSize: 16),
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

  Future<void> loginUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email ?? "empty", password: password ?? "empty");
  }
}
