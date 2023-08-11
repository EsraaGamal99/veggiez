import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggiez/modules/login/login_cubit/cubit.dart';
import 'package:veggiez/modules/login/login_cubit/states.dart';
import 'package:veggiez/modules/sign_up/sign_up_screen.dart';

import 'package:veggiez/shared/componentes/components.dart';

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
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context, state) {},
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
                          if(value!.trim().isEmpty)
                            return 'Enter your email address';
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
                        isPassword: LoginCubit.get(context).isPassword,
                        validate: (String? value) {
                          if(value!.trim().isEmpty)
                           return 'Enter your password';
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: LoginCubit.get(context).suffix,
                        suffixPressed:(){
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
                          defaultTextButton(onPressed: (){}, text: 'Forget password ?',),

                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      defaultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()){
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                        text: 'Sign In',
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
                              navigateTo(context, SignUpScreen(),);
                              print('SignUp Button');
                            },
                            text: 'Signup Here',
                          ),
                        ],
                      ),
                      defaultTextButton(onPressed: (){}, text: 'Continue without Login',),
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
