import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/modules/login/login_cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());


  static LoginCubit get(context) => BlocProvider.of(context);


  bool check = false;
  void checkBoxSelect(){
    check = !check;
    emit(LoginCheckBoxState());
  }


  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword?Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(LoginChangePasswordState());
  }


}