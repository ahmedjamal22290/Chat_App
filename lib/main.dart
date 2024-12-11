import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:k/cubit/dark_mode_cubit/mode_states.dart';
import 'package:k/firebase_options.dart';
import 'package:k/screens/chat_page.dart';
import 'package:k/screens/login_page.dart';
import 'package:k/screens/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const scholarChat());
}

class scholarChat extends StatelessWidget {
  const scholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => modeCubit(),
      child: BlocBuilder<modeCubit, modes>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              brightness:
                  state is darkState ? Brightness.dark : Brightness.light,
              useMaterial3: true,
            ),
            routes: {
              loginPage.id: (cotext) {
                return loginPage();
              },
              registerPage.id: (context) => registerPage(),
              chatPage.id: (context) => chatPage(),
            },
            debugShowCheckedModeBanner: false,
            initialRoute: loginPage.id,
          );
        },
      ),
    );
  }
}
