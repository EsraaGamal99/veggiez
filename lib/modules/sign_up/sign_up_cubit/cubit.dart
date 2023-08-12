import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/models/user_model.dart';
import 'package:veggiez/modules/sign_up/sign_up_cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  bool check = false;
  void checkBoxSelect() {
    check = !check;
    emit(SignUpCheckBoxState());
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SignUpChangePasswordState());
  }

  IconData confirmSuffix = Icons.visibility_off_outlined;
  bool isConfirmPassword = true;
  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    confirmSuffix = isConfirmPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(SignUpChangeConfirmPasswordState());
  }

  UserModel? userModel;

  void createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) async {
    UserModel model = UserModel(
      phone: phone,
      email: email,
      name: name,
      uId: uId,
      image:
          'https://cdn-icons-png.flaticon.com/512/847/847969.png?w=740&t=st=1686120013~exp=1686120613~hmac=ca0d5c8214f5d5c563d6065dcdf2e669a9484b1ac0023c8b520fec708f0a6a81',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(uId));
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  void userSignUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(SignUpLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      //String id = value.user.uid;
      createUser(
        email: email,
        uId: value.user!.uid,
        name: name,
        phone: phone,
      );
      //emit(RegistersSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
    });
  }
}
