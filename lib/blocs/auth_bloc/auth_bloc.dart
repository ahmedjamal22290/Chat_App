import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          FirebaseAuth auth = FirebaseAuth.instance;
          UserCredential user = await auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSucess());
        } on FirebaseAuthException catch (ex) {
          emit(LoginFailure(ex.code));
        } catch (e) {
          emit(LoginFailure('Error'));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        FirebaseAuth auth = FirebaseAuth.instance;
        try {
          UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(RegisterSucess());
        } on FirebaseAuthException catch (ex) {
          emit(RegisterFailure(ex.code));
        } on Exception {
          emit(RegisterFailure('There was an Error'));
        }
      }
    });
  }
  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   super.onTransition(transition);

  //   log(transition.toString());
  // }
}
