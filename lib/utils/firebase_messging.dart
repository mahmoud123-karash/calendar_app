import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/models/notification_service.dart';
import 'package:calendar_app/modules/event_details/event_details.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

void subscribeToTopic() async {
  await firebaseMessaging.subscribeToTopic('events');
  if (kDebugMode) {
    print('sub');
  }
}

void unSubscribeToTopic() async {
  await firebaseMessaging.unsubscribeFromTopic('events');
  if (kDebugMode) {
    print('unsub');
  }
}

void gettoken() async {
  var token = await firebaseMessaging.getToken();
  if (kDebugMode) {
    print(token);
  }
}

void initialFMessage(initialMessage) {
  FirebaseMessaging.instance.getInitialMessage().then((value) {
    initialMessage = value?.data.toString();
  });
}

void onMessage() {
  FirebaseMessaging.onMessage.listen(
    (message) {
      NotificationService().showOnNotification(
        id: 1,
        title: message.notification!.title!,
      );
    },
  );
}

void onMessageOpenedApp(context) {
  FirebaseMessaging.onMessageOpenedApp.listen(
    (message) {
      navigatorTo(
        context,
        EventDetails(
          isdark: true,
          event: EventModel(
            id: '',
            title: message.notification!.title,
            description: message.data['body'],
            dateJ: message.data['dateJ'],
            image: message.data['image'],
            dateM: message.data['dateM'],
          ),
        ),
      );
    },
  );
}

Future onBackgroundMessage(context) async {
  FirebaseMessaging.onBackgroundMessage(
    (message) async {},
  );
}
