abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpChangePasswordState extends SignUpStates {}

class SignUpChangeConfirmPasswordState extends SignUpStates {}

class SignUpCheckBoxState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String error;

  SignUpErrorState(this.error);
}

class CreateUserSuccessState extends SignUpStates {
  late final String uId;
  CreateUserSuccessState(this.uId);
}

class CreateUserErrorState extends SignUpStates {
  final String error;

  CreateUserErrorState(this.error);
}
