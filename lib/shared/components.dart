import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigatorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => widget)),
    );

void navigatorToAndfinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: ((context) => widget)),
      (route) => false,
    );

Future<bool?> myToast(
        {required String message, Color color = const Color(0xFF046E8F)}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);

Widget dialogPermission(
        {required BuildContext context,
        required VoidCallback ontap,
        required VoidCallback oncancel}) =>
    AlertDialog(
      title: Text(
        S.of(context).noti,
        style: TextStyle(color: myColor),
      ),
      content: Text(S.of(context).permisd),
      actions: [
        TextButton(
          onPressed: oncancel,
          child: Text(S.of(context).no),
        ),
        TextButton(
          onPressed: ontap,
          child: Text(S.of(context).ok),
        )
      ],
    );
