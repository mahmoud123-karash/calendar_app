// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:calendar_app/cubit/login_cubit/Login_states.dart';
import 'package:calendar_app/cubit/login_cubit/login_cubit.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/login_screen/widgets/button_widget.dart';
import 'package:calendar_app/modules/login_screen/widgets/pass_textfield_widget.dart';
import 'package:calendar_app/modules/login_screen/widgets/textfield_widget.dart';
import 'package:calendar_app/shared/assets.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is RegistersuccessfullState) {
          myToast(message: S.of(context).ress);
          Navigator.pop(context);
        }
        if (state is RegistererrorState) {
          myToast(message: S.of(context).loginE);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            iconTheme: IconThemeData(color: myColor),
            actionsIconTheme: IconThemeData(color: myColor),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
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
                        S.of(context).account,
                        style: TextStyle(
                          color: myColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFieldWidget(
                        controller: emailController,
                        label: S.of(context).email,
                        icon: Icons.email,
                        textInputType: TextInputType.emailAddress,
                      ),
                      PassTextFieldWidget(controller: passController),
                      TextFieldWidget(
                        controller: nameController,
                        label: S.of(context).rename,
                        icon: Icons.person,
                        textInputType: TextInputType.text,
                      ),
                      TextFieldWidget(
                        controller: phoneController,
                        label: S.of(context).rephone,
                        icon: Icons.phone_android_outlined,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: state is! RegisterloadingState
                            ? ButtonWidget(
                                text: S.of(context).account,
                                onpressed: () {
                                  if (formkey.currentState!.validate()) {
                                    LoginCubit.get(context).registerNewUser(
                                        email: emailController.text,
                                        password: passController.text,
                                        phone: phoneController.text,
                                        name: nameController.text);
                                  }
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: myColor,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
