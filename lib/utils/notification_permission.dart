import 'package:calendar_app/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermissions({context, ontap}) async {
  if (await Permission.notification.isPermanentlyDenied) {
    showDialog(
      context: context,
      builder: (context) => dialogPermission(
          context: context,
          ontap: () {
            openAppSettings();
            Navigator.pop(context);
          },
          oncancel: () {
            Navigator.pop(context);
          }),
    );
    return;
  }

  PermissionStatus status = await Permission.notification.request();

  if (status.isDenied) {
    showDialog(
      context: context,
      builder: (context) => dialogPermission(
          context: context,
          ontap: () {
            openAppSettings();
            Navigator.pop(context);
          },
          oncancel: () {
            Navigator.pop(context);
          }),
    );
  } else if (status.isPermanentlyDenied) {
    showDialog(
      context: context,
      builder: (context) => dialogPermission(
          context: context,
          ontap: () {
            openAppSettings();
            Navigator.pop(context);
          },
          oncancel: () {
            Navigator.pop(context);
          }),
    );
  } else if (status.isGranted) {
    ontap();
  }
}
