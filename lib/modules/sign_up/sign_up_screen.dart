import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/modules/login/login_screen.dart';
import 'package:veggiez/modules/sign_up/sign_up_cubit/cubit.dart';
import 'package:veggiez/modules/sign_up/sign_up_cubit/states.dart';
import 'package:veggiez/shared/componentes/components.dart';

import '../../shared/componentes/constans.dart';
import '../../shared/network/local/cache_helper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  late final TextEditingController emailController = TextEditingController();

  late final TextEditingController passwordController = TextEditingController();

  late final TextEditingController confirmPasswordController =
      TextEditingController();
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is CreateUserSuccessState) {
              CacheHelper.saveData(
                key: 'token',
                value: state.uId,
              ).then((value) {
                tokenID = state.uId;

                navigateAndFinish(
                  context,
                  LoginScreen(),
                );
              });
            } else if (state is CreateUserErrorState) {
              showToast(
                msg: state.error,
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                top: 35,
                bottom: 35,
                start: 16,
                end: 16,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/sign.png'),
                        width: 230,
                        height: 200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter your Email';
                          }
                          return null;
                        },
                        label: 'Email',
                        prefix: Icons.alternate_email_outlined,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        isPassword: SignUpCubit.get(context).isPassword,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: SignUpCubit.get(context).suffix,
                        suffixPressed: () {
                          SignUpCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        isPassword: SignUpCubit.get(context).isConfirmPassword,
                        validate: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                        label: 'Confirm Password',
                        prefix: Icons.lock,
                        suffix: SignUpCubit.get(context).confirmSuffix,
                        suffixPressed: () {
                          SignUpCubit.get(context)
                              .changeConfirmPasswordVisibility();
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: SignUpCubit.get(context).check,
                              onChanged: (value) {
                                SignUpCubit.get(context).checkBoxSelect();
                              }),
                          Text(
                            'Remember Password',
                          ),
                          Spacer(),
                          defaultTextButton(
                            onPressed: () {},
                            text: 'Forget password ?',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! SignUpLoadingState,
                        builder: (context) => defaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SignUpCubit.get(context).userSignUp(
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          text: 'Sign Up',
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                print('GOOGLE');
                              },
                              child: Image(
                                image: AssetImage('assets/images/gg.png'),
                              )),
                          SizedBox(
                            width: 15.0,
                          ),
                          InkWell(
                              onTap: () {
                                print('FACEBOOK');
                              },
                              child: Image(
                                image: AssetImage('assets/images/ff.png'),
                              )),
                          SizedBox(
                            width: 15.0,
                          ),
                          InkWell(
                              onTap: () {
                                print('TWITTER');
                              },
                              child: Image(
                                image: AssetImage('assets/images/tt.png'),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 0.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                          ),
                          defaultTextButton(
                            onPressed: () {
                              navigateTo(
                                context,
                                LoginScreen(),
                              );
                              print('Login Button');
                            },
                            text: 'Login',
                            color: Color(0xFFB91825),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
