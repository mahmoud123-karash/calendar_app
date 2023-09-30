import 'package:calendar_app/cubit/calendar_cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
        builder: (context, state) {
      bool isdark = CalendarCubit.get(context).isdark;
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: !isdark ? Colors.white : blackColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: isdark ? Colors.white60 : Colors.black,
          fixedColor: myColor,
          currentIndex: CalendarCubit.get(context).currentindex,
          onTap: (value) {
            CalendarCubit.get(context).getindex(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_view_day_outlined),
              label: S.of(context).title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_today_outlined),
              label: S.of(context).myevent,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: S.of(context).settings,
            ),
          ],
        ),
        body: CalendarCubit.get(context)
            .screens[CalendarCubit.get(context).currentindex],
      );
    });
  }
}
