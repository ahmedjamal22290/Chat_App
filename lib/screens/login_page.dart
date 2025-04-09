import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/blocs/auth_bloc/auth_bloc.dart';
import 'package:k/constants.dart';
import 'package:k/helper/show_snack_message.dart';
import 'package:k/screens/chat_page.dart';
import 'package:k/screens/register_page.dart';
import 'package:k/widgets/custom_botton.dart';
import 'package:k/widgets/custom_text_filed.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  bool validtion = true;
  static String id = 'logInPage';

  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  bool scure = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucess) {
          showSnackMessage(context, 'Success');
          isLoading = false;
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
                      const Text(
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
                      CustomTextFromField(
                        onChanged: (value) {
                          email = value;
                        },
                        labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFromField(
                        onChanged: (value) {
                          password = value;
                        },
                        labelText: 'Password',
                        scure: scure,
                        suffixIcon: true,
                        onTap: () {
                          scure = scure ? false : true;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CustomBotton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthBloc>(context)
                        .add(LoginEvent(email: email!, password: password!));

                    isLoading = false;
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
      ),
    );
  }

  GestureDetector navigatToRegisterPage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RegisterPage.id);
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
}
