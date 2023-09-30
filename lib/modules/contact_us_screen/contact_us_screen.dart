import 'package:calendar_app/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/messsage_screen/message_screen.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).contact),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                CalendarCubit.get(context).contactUsEmail();
              },
              icon: Icon(
                Icons.email_outlined,
                size: 50,
                color: myColor,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatorTo(context, const MessageScreen());
              },
              icon: Icon(
                Icons.message_outlined,
                size: 50,
                color: myColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
