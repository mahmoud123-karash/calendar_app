import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/layout/widgets/header_drawer_widget.dart';
import 'package:calendar_app/modules/settings_screen/widgets/text_titile_widget.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:calendar_app/utils/firebase_messging.dart';
import 'package:calendar_app/utils/notification_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
      builder: (context, state) {
        bool isdark = CalendarCubit.get(context).isdark;
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).settings),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: HeaderDrawerWidget()),
              const SizedBox(
                height: 30,
              ),
              TextTitleWidget(text: S.of(context).noti),
              ListTile(
                title: Text(
                  S.of(context).notification,
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: Checkbox(
                  value: CalendarCubit.get(context).sub,
                  onChanged: (value) async {
                    if (value!) {
                      requestNotificationPermissions(
                          context: context,
                          ontap: () {
                            subscribeToTopic();
                            myToast(message: S.of(context).sub);
                            CalendarCubit.get(context).subAndUnSub();
                          });
                    } else {
                      CalendarCubit.get(context).subAndUnSub();
                      unSubscribeToTopic();
                      myToast(message: S.of(context).unsub);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextTitleWidget(text: S.of(context).themes),
              SwitchListTile(
                activeColor: myColor,
                inactiveTrackColor: Colors.grey[300],
                secondary: Icon(
                  isdark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                ),
                title: Text(
                  S.of(context).theme,
                ),
                value: isdark,
                onChanged: (value) {
                  CalendarCubit.get(context).changeAppTheme();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextTitleWidget(text: S.of(context).app),
              ListTile(
                onTap: () {
                  CalendarCubit.get(context).contactUsEmail();
                },
                title: Text(
                  S.of(context).contact,
                  style: const TextStyle(fontSize: 20),
                ),
                leading: const Icon(
                  Icons.contact_mail_outlined,
                  size: 20,
                ),
              ),
              ListTile(
                onTap: () {
                  CalendarCubit.get(context).shareMyApp();
                },
                title: Text(
                  S.of(context).share,
                  style: const TextStyle(fontSize: 20),
                ),
                leading: const Icon(
                  Icons.share,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
