import 'package:calendar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget(
      {super.key,
      required this.size,
      required this.name,
      required this.icon,
      required this.controller,
      required this.ontap,
      required this.textInputType});
  final Size size;
  final String name;
  final IconData icon;
  final TextEditingController controller;
  final VoidCallback ontap;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onTap: ontap,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).validate;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: const TextStyle(fontSize: 25),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
