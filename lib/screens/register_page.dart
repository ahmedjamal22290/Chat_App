import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/constants.dart';
import 'package:k/cubit/login_cubit/authentication_cubit.dart';
import 'package:k/cubit/login_cubit/authentication_state.dart';
import 'package:k/helper/show_snack_message.dart';
import 'package:k/widgets/custom_botton.dart';
import 'package:k/widgets/custom_text_filed.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  bool validtionEmail = true, validtionPass = true, validtion = true;
  static String id = 'registerPage';

  String? email, password, firstName, lastName, errorPass, errorEmail;
  GlobalKey<FormState> fromKey = GlobalKey();

  bool isLoading = false;
  bool scure = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSucess) {
          showSnackMessage(context, 'success');
          Navigator.pushNamed(context, 'chatPage', arguments: email);
          isLoading = false;
        } else if (state is AuthenticationLoading) {
          isLoading = true;
        } else if (state is AuthenticationFailure) {
          isLoading = false;
          showSnackMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
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
                    key: fromKey,
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
                        CustomTextFromField(
                          onChanged: (value) {
                            firstName = value;
                          },
                          labelText: 'First Name',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFromField(
                          onChanged: (value) {
                            lastName = value;
                          },
                          labelText: 'Last Name',
                        ),
                        const SizedBox(
                          height: 15,
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
                    if (fromKey.currentState!.validate()) {
                      BlocProvider.of<AuthenticationCubit>(context)
                          .createUser(email: email!, password: password!);
                    } else {}
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
                    navigatToLoginPage(context),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  GestureDetector navigatToLoginPage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Text(
        "Sign In",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.amberAccent,
          fontSize: 16,
        ),
      ),
    );
  }
}
