abstract class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSucess extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationFailure extends AuthenticationState {
  String errorMessage;
  AuthenticationFailure(this.errorMessage);
}
