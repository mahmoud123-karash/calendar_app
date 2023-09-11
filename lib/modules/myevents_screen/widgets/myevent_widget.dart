import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/models/notification_service.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class MyEventWidget extends StatelessWidget {
  const MyEventWidget({super.key, required this.isdark, required this.myevent});
  final bool isdark;
  final Map myevent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isdark ? Colors.white.withOpacity(0.2) : Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      myevent['name'],
                      style: TextStyle(
                          color: myColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    myevent['date'],
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    CalendarCubit.get(context).delteteData(
                      id: myevent['id'],
                      context: context,
                    );
                    NotificationService()
                        .cancelNotification1(id: myevent['id']);
                  },
                  icon: const Icon(Icons.delete_rounded))
            ],
          ),
        ),
      ),
    );
  }
}
