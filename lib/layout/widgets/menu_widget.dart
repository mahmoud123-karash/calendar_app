import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/layout/Layout_screen.dart';
import 'package:calendar_app/layout/widgets/header_drawer_widget.dart';
import 'package:calendar_app/modules/main_event_screen/main_event_screen.dart';
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
        return Drawer(
          width: size.width / 3,
          child: Column(
            children: [
              const HeaderDrawerWidget(),
              const SizedBox(
                height: 25,
              ),
              ListTile(
                onTap: () {
                  navigatorTo(context, const LayoutScreen());
                },
                leading: const Icon(Icons.calendar_month),
                title: Text(
                  S.of(context).title,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              ListTile(
                onTap: () {
                  navigatorTo(context, const MainEventScreen());
                },
                leading: const Icon(Icons.event_available_outlined),
                title: Text(
                  S.of(context).myevent,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.arrow_back_ios_new_outlined),
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
                  navigatorTo(context, const SettingsScreen());
                },
                leading: const Icon(Icons.settings),
                title: Text(
                  S.of(context).settings,
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
