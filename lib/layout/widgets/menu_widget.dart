import 'package:calendar_app/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/layout/widgets/header_drawer_widget.dart';
import 'package:calendar_app/layout/widgets/logout_dialog_widget.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/modules/login_screen/login_screen.dart';
import 'package:calendar_app/modules/settings_screen/settings_screen.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
      builder: (context, state) {
        bool isdark = CalendarCubit.get(context).isdark;
        var uid = cache_helper.getData(key: 'uid');
        return Drawer(
          width: size.width / 3,
          child: Column(
            children: [
              const HeaderDrawerWidget(),
              const SizedBox(
                height: 25,
              ),
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
              ListTile(
                onTap: () {
                  navigatorTo(
                      context,
                      const SettingsScreen(
                        ish: true,
                      ));
                },
                leading: const Icon(Icons.settings),
                title: Text(
                  S.of(context).settings,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              ListTile(
                onTap: () {
                  if (uid != null) {
                    showDialog(
                        context: context,
                        builder: (context) => const LogoutDialogWidget());
                  } else {
                    navigatorToAndfinish(context, const LoginScreen());
                  }
                },
                leading: Icon(uid != null ? Icons.logout : Icons.login),
                title: Text(
                  uid != null ? S.of(context).logout : S.of(context).login,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
