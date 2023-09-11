import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/modules/add_event_screen/add_event_details.dart';
import 'package:calendar_app/modules/myevents_screen/widgets/myevent_widget.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({super.key});

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  @override
  void initState() {
    CalendarCubit.get(context)
        .getDataFromDataBase(CalendarCubit.get(context).database);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarStates>(
      builder: (context, state) {
        bool isdark = CalendarCubit.get(context).isdark;
        var myevents = CalendarCubit.get(context).myEvents;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigatorTo(
                  context,
                  AddEventDetails(
                    isdark: isdark,
                  ));
            },
            child: const Icon(Icons.add),
          ),
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
            title: Text(S.of(context).myevent),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) => MyEventWidget(
                isdark: isdark,
                myevent: myevents[index],
              ),
              itemCount: myevents.length,
            ),
          ),
        );
      },
    );
  }
}
