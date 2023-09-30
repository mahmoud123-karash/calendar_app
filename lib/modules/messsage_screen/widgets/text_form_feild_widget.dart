import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class TextFormFeildWidget extends StatelessWidget {
  const TextFormFeildWidget(
      {super.key,
      required this.controller,
      required this.maxLines,
      required this.textInputType,
      required this.lablel});
  final TextEditingController controller;
  final int maxLines;
  final TextInputType textInputType;
  final String lablel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).validate;
        }
        return null;
      },
      keyboardType: textInputType,
      controller: controller,
      cursorColor: myColor,
      decoration: InputDecoration(
        labelText: lablel,
        labelStyle: TextStyle(
            color: myColor, fontSize: 20, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: myColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: myColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: myColor),
        ),
      ),
    );
  }
}
