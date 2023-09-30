// ignore_for_file: camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:calendar_app/cubit/login_cubit/Login_states.dart';
import 'package:calendar_app/cubit/login_cubit/login_cubit.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/layout/Layout_screen.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/modules/forget_pass_screen/reset_password.dart';
import 'package:calendar_app/modules/login_screen/widgets/button_widget.dart';
import 'package:calendar_app/modules/login_screen/widgets/pass_textfield_widget.dart';
import 'package:calendar_app/modules/login_screen/widgets/textfield_widget.dart';
import 'package:calendar_app/modules/register_screen/register_screen.dart';
import 'package:calendar_app/shared/assets.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginerrorState) {
          myToast(message: S.of(context).loginE);
        }

        if (state is LoginsuccessfullState) {
          navigatorToAndfinish(context, LayoutScreen());
          cache_helper.saveData(key: 'skip', value: true);
          myToast(message: S.of(context).loginS);
          cache_helper.saveData(key: 'uid', value: state.uid);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.cal2),
                        ),
                      ),
                    ),
                    Text(
                      S.of(context).login,
                      style: TextStyle(
                        color: myColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                      controller: emailController,
                      label: S.of(context).email,
                      icon: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress,
                    ),
                    PassTextFieldWidget(
                      controller: passwordController,
                    ),
                    InkWell(
                      onTap: () {
                        navigatorTo(context, ResetPsaaword());
                      },
                      child: Text(
                        S.of(context).fpass,
                        style: TextStyle(
                            color: myColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: state is! LoginloadingState
                          ? ButtonWidget(
                              text: S.of(context).login,
                              onpressed: () {
                                if (formkey.currentState!.validate()) {
                                  LoginCubit.get(context).loginUser(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                            )
                          : CircularProgressIndicator(
                              color: myColor,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).noaccount,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigatorTo(context, RegisterScreen());
                          },
                          child: Text(
                            S.of(context).register,
                            style: TextStyle(color: myColor),
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        navigatorToAndfinish(context, LayoutScreen());
                        cache_helper.saveData(key: 'skip', value: true);
                      },
                      child: Text(
                        S.of(context).loginSkip,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
