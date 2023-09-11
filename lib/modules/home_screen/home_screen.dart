// ignore_for_file: file_names

import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/home_screen/widgets/date_widget.dart';
import 'package:calendar_app/modules/home_screen/widgets/event_item_widget.dart';
import 'package:calendar_app/modules/home_screen/widgets/swiper_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
      builder: (context, state) {
        return BlocBuilder<CalendarCubit, CalendarStates>(
          builder: (context, state) {
            bool isdark = CalendarCubit.get(context).isdark;
            var events = CalendarCubit.get(context).events;
            var banners = CalendarCubit.get(context).banners;

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      if (ZoomDrawer.of(context)!.isOpen()) {
                        ZoomDrawer.of(context)!.close();
                      } else {
                        ZoomDrawer.of(context)!.open();
                      }
                    },
                    icon: const Icon(Icons.menu)),
                title: Text(S.of(context).title),
              ),
              body: Column(
                children: [
                  if (banners.isNotEmpty) SwiperBannerWidget(banners: banners),
                  const SizedBox(
                    height: 10,
                  ),
                  DateWidget(isdark: isdark),
                  state is LoadingGetEventsState
                      ? const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : events.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(S.of(context).noevents),
                            )
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      EventItemWidget(
                                    isdark: isdark,
                                    event: events[index],
                                  ),
                                  itemCount: events.length,
                                ),
                              ),
                            )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
