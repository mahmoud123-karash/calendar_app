// ignore_for_file: file_names

import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/layout/widgets/drawer_widget.dart';
import 'package:calendar_app/modules/home_screen/home_screen.dart';
import 'package:calendar_app/utils/firebase_messging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  String? initialMessage;

  @override
  void dispose() {
    zoomDrawerController.close;
    super.dispose();
  }

  @override
  void initState() {
    subscribeToTopic();
    onMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
      builder: (context, state) {
        bool isdark = CalendarCubit.get(context).isdark;
        return DrawerWidget(
          isdark: isdark,
          mainScrenn: const HomeScreen(),
          zoomDrawerController: zoomDrawerController,
        );
      },
    );
  }
}
