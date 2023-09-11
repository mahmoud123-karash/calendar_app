// ignore_for_file: file_names

import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/layout/widgets/drawer_widget.dart';
import 'package:calendar_app/modules/myevents_screen/myevents_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainEventScreen extends StatefulWidget {
  const MainEventScreen({super.key});

  @override
  State<MainEventScreen> createState() => _MainEventScreenState();
}

class _MainEventScreenState extends State<MainEventScreen> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  void dispose() {
    zoomDrawerController.close;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
      builder: (context, state) {
        bool isdark = CalendarCubit.get(context).isdark;
        return DrawerWidget(
          isdark: isdark,
          mainScrenn: const MyEventsScreen(),
          zoomDrawerController: zoomDrawerController,
        );
      },
    );
  }
}
