import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/modules/event_details/widgets/image_item_widget.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.event, required this.isdark});
  final EventModel event;
  final bool isdark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).event),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (event.image != '')
                ImageItemWidget(image: event.image!, isdark: isdark),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    " ${S.of(context).eventname}:",
                    style: TextStyle(
                      color: myColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                event.title!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                " ${S.of(context).eventdate}:",
                style: TextStyle(
                  color: myColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${event.dateM}',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '${event.dateJ}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                " ${S.of(context).eventde}:",
                style: TextStyle(
                  color: myColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                event.description!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
