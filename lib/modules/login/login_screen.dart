import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/modules/layout/layout_screen.dart';
import 'package:veggiez/modules/login/login_cubit/cubit.dart';
import 'package:veggiez/modules/login/login_cubit/states.dart';
import 'package:veggiez/modules/sign_up/sign_up_screen.dart';

import 'package:veggiez/shared/componentes/components.dart';
import 'package:veggiez/shared/componentes/constans.dart';
import 'package:veggiez/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  late final TextEditingController emailController = TextEditingController();

  late final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              //AppCubit.get(context).getUserData();
              CacheHelper.saveData(value: state.uId, key: 'uId').then((value) {
                tokenID = state.uId;
                showToast(
                  color: Colors.green,
                  msg: 'Login is successfully',
                );
              });
            } else if (state is LoginErrorState) {
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
                          if (value!.trim().isEmpty)
                            return 'Enter your email address';
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
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        isPassword: LoginCubit.get(context).isPassword,
                        validate: (String? value) {
                          if (value!.trim().isEmpty)
                            return 'Enter your password';
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: LoginCubit.get(context).suffix,
                        suffixPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: LoginCubit.get(context).check,
                              onChanged: (value) {
                                LoginCubit.get(context).checkBoxSelect();
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
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context)
                                  .userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((value) => {
                                        navigateAndFinish(
                                          context,
                                          LayoutScreen(),
                                        )
                                      });
                            }
                          },
                          text: 'Sign In',
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          defaultTextButton(
                            onPressed: () {
                              navigateTo(
                                context,
                                SignUpScreen(),
                              );
                              print('SignUp Button');
                            },
                            text: 'Signup Here',
                          ),
                        ],
                      ),
                      defaultTextButton(
                        onPressed: () {},
                        text: 'Continue without Login',
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   //crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //   defaultTextButton(onPressed: (){}, text: 'Continue without Login',),
                      // ],),
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
