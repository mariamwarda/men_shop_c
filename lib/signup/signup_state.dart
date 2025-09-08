

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final dynamic data;
  SignUpSuccess(this.data);
}

class SignUpFailure extends SignUpStates {
  final String msg;
  SignUpFailure(this.msg);
}

class SignUpTogglePassword extends SignUpStates {
  final bool obscureText;
  SignUpTogglePassword(this.obscureText);
}
