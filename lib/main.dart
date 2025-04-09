import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/blocs/auth_bloc/auth_bloc.dart';
import 'package:k/cubit/chat_cubit/chat_cubit.dart';
import 'package:k/cubit/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:k/cubit/login_cubit/authentication_cubit.dart';
import 'package:k/cubit/dark_mode_cubit/mode_states.dart';
import 'package:k/firebase_options.dart';
import 'package:k/screens/chat_page.dart';
import 'package:k/screens/login_page.dart';
import 'package:k/screens/register_page.dart';
import 'package:k/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (contex) => ModeCubit()),
        BlocProvider(create: (contex) => AuthenticationCubit()),
        BlocProvider(create: (contex) => ChatCubit()),
        BlocProvider(create: (contex) => AuthBloc()),
      ],
      child: BlocBuilder<ModeCubit, Modes>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              brightness:
                  state is DarkState ? Brightness.dark : Brightness.light,
              useMaterial3: true,
            ),
            routes: {
              LoginPage.id: (cotext) {
                return LoginPage();
              },
              RegisterPage.id: (context) => RegisterPage(),
              ChatPage.id: (context) => const ChatPage(),
            },
            debugShowCheckedModeBanner: false,
            initialRoute: LoginPage.id,
          );
        },
      ),
    );
  }
}
