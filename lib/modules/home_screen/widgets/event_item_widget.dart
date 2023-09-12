import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/modules/event_details/event_details.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key, required this.isdark, required this.event});
  final bool isdark;
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          navigatorTo(
            context,
            EventDetails(
              event: event,
              isdark: isdark,
            ),
          );
        },
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
                    Text(
                      event.title!,
                      style: TextStyle(
                          color: myColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${event.dateM}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '${event.dateJ}',
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
