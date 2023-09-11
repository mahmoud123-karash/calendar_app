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

Future<bool?> myToast({required String message}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: myColor,
    textColor: Colors.white,
    fontSize: 16.0);
