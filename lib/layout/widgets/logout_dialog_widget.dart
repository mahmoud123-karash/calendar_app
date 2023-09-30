import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/modules/login_screen/login_screen.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).logout,
        style: TextStyle(color: myColor),
      ),
      content: Text(S.of(context).logoutq),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).no),
        ),
        TextButton(
          onPressed: () {
            cache_helper.removeData(key: 'uid');
            cache_helper.saveData(key: 'skip', value: false);
            navigatorToAndfinish(context, const LoginScreen());
          },
          child: Text(S.of(context).logoutm),
        )
      ],
    );
  }
}
