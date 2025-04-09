part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitial extends AuthState {}

class LoginSucess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class RegisterInitial extends AuthState {}

class RegisterSucess extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
