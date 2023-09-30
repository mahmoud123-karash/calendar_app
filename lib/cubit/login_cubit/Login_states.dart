// ignore_for_file: file_names

abstract class LoginStates {}

class IntialLoginState extends LoginStates {}

class HiddenPassState extends LoginStates {}

//get users
class InitialgetuserState extends LoginStates {}

class SuccessgetuserState extends LoginStates {}

class ErrorgetuserState extends LoginStates {}

//Register
class RegisterloadingState extends LoginStates {}

class RegistersuccessfullState extends LoginStates {}

class RegistererrorState extends LoginStates {
  final String error;
  RegistererrorState(this.error);
}

//Login
class LoginloadingState extends LoginStates {}

class LoginsuccessfullState extends LoginStates {
  final String uid;
  LoginsuccessfullState(this.uid);
}

class LoginerrorState extends LoginStates {
  final String error;
  LoginerrorState(this.error);
}

//update usertype
class UpdateloadingrState extends LoginStates {}

class UpdateSuccessState extends LoginStates {}

class UpdateerrorState extends LoginStates {}

//reset pass
class LoadingResetPassState extends LoginStates {}

class SuccessResetPassState extends LoginStates {}

class ErrorResetPassState extends LoginStates {}
