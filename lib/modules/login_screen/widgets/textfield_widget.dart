import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.label,
      required this.icon,
      required this.textInputType});
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType textInputType;

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
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: label,
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
            icon,
            color: myColor,
          ),
        ),
      ),
    );
  }
}
