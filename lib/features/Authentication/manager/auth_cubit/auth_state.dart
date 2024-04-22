abstract class AuthState{}

class AuthInitial extends AuthState{}

class RegisterSuccess extends AuthState{}

class RegisterLoading extends AuthState{}

class RegisterFailure extends AuthState{
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}

class LoginSuccess extends AuthState{}

class LoginLoading extends AuthState{}

class LoginFailure extends AuthState{
  String errorMessage;
  LoginFailure({required this.errorMessage});
}

class LogoutLoading extends AuthState{}
class LogoutSuccess extends AuthState{}
class LogoutFailure extends AuthState{
  String errorMessage;
  LogoutFailure({required this.errorMessage});
}

class ChangePasswordVisibility extends AuthState{}
class ChangeConfirmPasswordVisibility extends AuthState{}