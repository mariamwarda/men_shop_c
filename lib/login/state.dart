
abstract class LoginStates{}

class LoginInitial extends LoginStates{}
class LoginLoading extends LoginStates{}
class LoginSuccess extends LoginStates{
  final String msg;

  LoginSuccess(this.msg);
}
class LoginFailure extends LoginStates{
  final String msg;
  LoginFailure(this.msg);

}

