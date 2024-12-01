import 'package:flutter/material.dart';
import 'package:k/screens/login_page.dart';

void main() {
  runApp(const scholarChat());
}

class scholarChat extends StatelessWidget {
  const scholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'logInPage': (cotext) {
          return loginPage();
        },
      },
      debugShowCheckedModeBanner: false,
      home: loginPage(),
    );
  }
}
