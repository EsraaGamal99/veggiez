import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/modules/sign_up/sign_up_cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates>{
  SignUpCubit() : super(SignUpInitialState());


  static SignUpCubit get(context) => BlocProvider.of(context);


  bool check = false;
  void checkBoxSelect(){
    check = !check;
    emit(SignUpCheckBoxState());
  }


  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword?Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SignUpChangePasswordState());
  }

  IconData confirmSuffix = Icons.visibility_off_outlined;
  bool isConfirmPassword = true;
  void changeConfirmPasswordVisibility(){
    isConfirmPassword = !isConfirmPassword;
    confirmSuffix = isConfirmPassword?Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SignUpChangeConfirmPasswordState());
  }

}