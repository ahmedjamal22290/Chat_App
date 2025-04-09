import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:k/cubit/login_cubit/authentication_state.dart';
import 'package:meta/meta.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(AuthenticationLoading());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthenticationSucess());
    } on FirebaseAuthException catch (ex) {
      emit(AuthenticationFailure(ex.code));
    } catch (e) {
      emit(AuthenticationFailure('Error'));
    }
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    emit(AuthenticationLoading());
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthenticationSucess());
    } on FirebaseAuthException catch (ex) {
      emit(AuthenticationFailure(ex.code));
    } on Exception {
      emit(AuthenticationFailure('There was an Error'));
    }
  }
}
