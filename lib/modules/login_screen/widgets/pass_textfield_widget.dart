import 'package:calendar_app/cubit/login_cubit/login_cubit.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class PassTextFieldWidget extends StatelessWidget {
  const PassTextFieldWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        cursorColor: myColor,
        style: TextStyle(color: myColor),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).validate;
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: LoginCubit.get(context).hiddenPass,
        decoration: InputDecoration(
          labelText: S.of(context).pass,
          labelStyle: TextStyle(color: myColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: myColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: myColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: myColor)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: myColor)),
          prefixIcon: Icon(
            Icons.lock,
            color: myColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              LoginCubit.get(context).makeThePassecure();
            },
            icon: LoginCubit.get(context).hiddenPass
                ? Icon(
                    Icons.visibility_off,
                    color: myColor,
                  )
                : Icon(
                    Icons.visibility,
                    color: myColor,
                  ),
          ),
        ),
      ),
    );
  }
}
