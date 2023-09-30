// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:calendar_app/cubit/login_cubit/Login_states.dart';
import 'package:calendar_app/cubit/login_cubit/login_cubit.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/login_screen/widgets/button_widget.dart';
import 'package:calendar_app/modules/login_screen/widgets/textfield_widget.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPsaaword extends StatelessWidget {
  ResetPsaaword({super.key});
  TextEditingController emailController = TextEditingController();
  var keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessResetPassState) {
          myToast(message: S.of(context).passRS);
        }
        if (state is ErrorResetPassState) {
          myToast(message: S.of(context).loginE);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
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
              child: Form(
                key: keyform,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        S.of(context).passf,
                        style: TextStyle(
                          fontSize: 25,
                          color: myColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      controller: emailController,
                      label: S.of(context).email,
                      icon: Icons.email,
                      textInputType: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonWidget(
                        text: S.of(context).passR,
                        onpressed: () {
                          if (keyform.currentState!.validate()) {
                            LoginCubit.get(context)
                                .resetpassword(emailController.text);
                          }
                        },
                      ),
                    ),
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
