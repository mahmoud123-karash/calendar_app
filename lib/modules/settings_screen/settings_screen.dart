import 'package:calendar_app/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/layout/widgets/header_drawer_widget.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/modules/contact_us_screen/contact_us_screen.dart';
import 'package:calendar_app/modules/forget_pass_screen/reset_password.dart';
import 'package:calendar_app/modules/login_screen/login_screen.dart';
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
          body: SingleChildScrollView(
            child: Column(
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
                    isdark
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
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
                    navigatorTo(context, const ContactUsScreen());
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
                ListTile(
                  onTap: () {
                    CalendarCubit.get(context).openBrowser(
                        uri:
                            'https://www.freeprivacypolicy.com/live/6b0c0267-1c5c-4575-a169-3cea2f844a12');
                  },
                  title: Text(
                    S.of(context).privacy,
                    style: const TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextTitleWidget(text: S.of(context).profile),
                ListTile(
                  onTap: () {
                    if (cache_helper.getData(key: 'uid') != null) {
                      navigatorTo(context, ResetPsaaword());
                    } else {
                      navigatorTo(context, const LoginScreen());
                    }
                  },
                  title: Text(
                    S.of(context).passf,
                    style: const TextStyle(fontSize: 20),
                  ),
                  leading: const Icon(
                    Icons.remove_red_eye_outlined,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
