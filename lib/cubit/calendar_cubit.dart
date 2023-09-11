// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/models/banner_model.dart';
import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/models/notification_service.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CalendarCubit extends Cubit<CalendarStates> {
  CalendarCubit() : super(InitailCalendarState());
  static CalendarCubit get(context) => BlocProvider.of(context);

  bool isdark = false;
  void changeAppTheme({bool? fromSP}) {
    if (fromSP != null) {
      isdark = fromSP;
    } else {
      isdark = !isdark;
      cache_helper.saveData(key: 'isdark', value: isdark);
    }
    emit(ChangeAppThemeState());
  }

  bool sub = true;
  void subAndUnSub({bool? fromSP}) {
    if (fromSP != null) {
      sub = fromSP;
    } else {
      sub = !sub;
      cache_helper.saveData(key: 'sub', value: sub);
    }
    emit(ChangeNotificationState());
  }

//sqflite
  Database? database;
  void openDataBase() {
    emit(LoadingOpenDatabaseState());
    openDatabase(
      'events.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE events (id INTEGER PRIMARY KEY, name TEXT, date TEXT)');
      },
      onOpen: (db) {
        getDataFromDataBase(db);
      },
    ).then((value) {
      database = value;

      emit(SuccessOpenDatabaseState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorOpenDatabaseState());
    });
  }

  DateTime eventdate = DateTime(2023);

  void addDataToDatabase({required String name, required String date}) async {
    emit(LoadingAddDataToDataBaseState());
    await database!.transaction((txn) async {
      await txn
          .rawInsert('INSERT INTO events (name, date) VALUES("$name","$date")')
          .then((value) {
        NotificationService().showNotification(
            id: value,
            title: 'مناسباتى',
            body: name,
            day: eventdate.day,
            month: eventdate.month,
            year: eventdate.year);
      });
      return null;
    }).then((value) {
      getDataFromDataBase(database);
      emit(SuccessAddDataToDataBaseState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorAddDataToDataBaseState());
    });
  }

  List<Map<String, Object?>> myEvents = [];
  void getDataFromDataBase(db) {
    emit(LoadingGetDataState());
    db.rawQuery('SELECT * FROM events').then((value) {
      myEvents = [];
      for (var element in value) {
        myEvents.add(element);
      }
      //print(tsabih.length);
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorGetDataState());
    });
  }

  void delteteData({required int id, required BuildContext context}) {
    emit(LoadingDeleteDataState());
    database!.rawDelete('DELETE FROM events WHERE id= ?', [id]).then((value) {
      getDataFromDataBase(database);
      myToast(message: S.of(context).eventd);
      emit(SuccessDeleteDataState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorDeleteDataState());
    });
  }

  List<EventModel> events = [];

  void getEvents() {
    emit(LoadingGetEventsState());
    FirebaseFirestore.instance
        .collection(year)
        .orderBy('dateM', descending: false)
        .snapshots()
        .listen((event) {
      events = [];
      for (var element in event.docs) {
        events.add(EventModel.fromjson(element.data()));
      }
      emit(SuccessGetEventsState());
    });
  }

  String jHijridate = '';
  String dateTime = '';

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void contactUsEmail() {
    emit(LoadingContactEmailState());
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'Abk.almalki.2015@gmail.com',
      query: encodeQueryParameters(
        <String, String>{
          'subject': 'write what you want to tell us',
        },
      ),
    );

    launchUrl(emailLaunchUri).then((value) {
      emit(SuccessContactEmailState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorContactEmailState());
    });
  }

  void openBrowser({required String uri}) {
    emit(LoadingOpenBrowserState());
    launchUrl(Uri.parse(uri)).then((value) {
      emit(SuccessOpenBrowserState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorOpenBrowserState());
    });
  }

  String appLink =
      'https://play.google.com/store/apps/details?id=com.example.myapp';

  String message = 'Check out my new app:';

  void shareMyApp() {
    emit(LoadingShareAppState());
    FlutterShare.share(title: 'Share App', text: message, linkUrl: appLink)
        .then((value) {
      emit(SuccessShareAppState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorShareAppState());
    });
  }

  List<BannerModel> banners = [];
  List<String> images = [];

  void getBanners() {
    emit(LoadingGetBannersState());
    FirebaseFirestore.instance
        .collection('banners')
        .snapshots()
        .listen((event) {
      banners = [];
      for (var element in event.docs) {
        banners.add(BannerModel.fromjson(element.data()));
        images.add(BannerModel.fromjson(element.data()).image!);
      }
      emit(SuccessGetBannersState());
    });
  }

  Future<String> getAccessToken() async {
    // Service account credentials
    const privateKey =
        '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC6I6RbaHIXjmRC\n7Ef3OEuDhXUOVaeUaOi0OSGYrsx/wGPP78P4QcnNb34uuA689vTqWDurA/mXriNa\ncTo/HwzFcJRmIx4RGISorNTus20g07S4GQArenOJnyzsF/CA5qxtplUT6wYuffCH\nmE/3JOV8fFbaR/w27b6Vbrt6EO+9hu+T5rFGz7EBs907WMsKzMOuUyCe/ooSut4s\nHlNHmvWdpNB6bEM7Ga7/oDUa4UeSrhB9KUpeSaWmL2VpQqOZqORSiwSA0bMcEpeJ\nbAX7lTGMj3aPizy8WNXw3l/AWvgjxc40BRSnDBZLxBrCHQq8jxtZA8LLgEnN3PhV\nEIku5CcVAgMBAAECggEAFs26Bhwav3Re0my5o6RTv/uawRRQ8Oy/TCD5qDJgnuqr\nb7SAeMqv1d6prJXjnFZ8NQof2TjQnDqlsx/5p5+pWWDhlU0KaG7CsHASsAxEO3LO\n34Tp5pRcUN5dda5jH5o4QpX6M0lQ2w5BEuOKhw0P85BqCtjUdx2TgnbBOgLsKUwy\naDAYc0yAtTMXrp5QcafmYXtUTEvkW0ODaTPPbu12ZdSezsbrmd8hlS+ZjOLkIXhz\nlpD6mSdW63UfEaj8/NeJxqXOLr7zCfqaqGW2L6tHXvW/aUCLX4lH0E4q/8T42uRU\n7dVDAvG5t8HJSEnB0F2bFkGGj3Gs22z5jCkF0TyMSwKBgQDwjeFn9atpqBrO8Jmn\niweRjBgGaEWmzorohxPTEfu0Jfc92K7qkV0ReQwWL4Vatp8C1gZQmOJffsEyFIMN\nLDfTcnHBIp9bMk0K5xGyn3sOzcLQifbM5lc6hFAX8Q2KM6RE7jJSu/TosBlmnZ/Z\nrTMbPp+jBu+gpq8cMKnAk+Uu/wKBgQDGF1AbC2DvPrxZ38huYdXOigPyvyRMZE4Z\n8GDfiG+wUpRDIorzVsD2uuQQqXBEcm/VU8rNiBncK076ln+47r165eIbfRw/o+mG\n/ZB0BOs0deKUNWtkNhZKFRyNew1n0gaJB0I3fOzjV8yeFhjTJNYnVjbtcuZebrVC\nwpCxI/D96wKBgDECNvIfMxULkqqmiieAQ8J7cEmd5NLfMZ2+J2PRPh6tvXl0M+7G\nPtfYeYXrmJeqrSq+v/qbq0MZZ/L0Ct8cKyOBJXvbueuyi8+00/44T7Hsacxiz01f\ngFYDru2xxrhpXQZOISKJ+JOPjR1C79ZBWzApygxE1X09eF+d6ne5qe+xAoGBAL8A\nBY4+F3Y3wHbMDr9X+EcQzqPF56L86E2ceFuwezjBNxHQgbgGA0MjivoB1i05Rlmk\nVJx+yah/3cRDTt2q3OpeM/kbVhyK2IX/gcRMZdmMfS84ntbeS/mch45ngtKDMSf4\n5sEH5IWEx9f6KG+WSiNdvtKPAk81YfMAFXGn3RuHAoGBAKC5Fl8xOffPtR58e/75\nXo1srUJXmMU5Iv4ETxmhsXwbkKNRgOwRGBxASQLKIcc19XfJdaHfVorl5Sq/OWOw\nWjoj/aiyoo41P7YtkwGj5fxXllv1u4OA8xrojmskyPrdM91y39XoGCLOHNLmnM98\nEUoMjV6X7SC9p0lE+sAQ16V/\n-----END PRIVATE KEY-----\n';
    const clientEmail =
        'firebase-adminsdk-1xpbm@academic-calendar-2cbd4.iam.gserviceaccount.com';

    // Create JWT
    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final expiryTime =
        currentTime + 3600; // Set expiration time to 1 hour from now

    final tokenPayload = {
      'iss': clientEmail,
      'aud': 'https://accounts.google.com/o/oauth2/token',
      'scope': 'https://www.googleapis.com/auth/firebase.messaging',
      'iat': currentTime,
      'exp': expiryTime,
    };

    final jwt = json.encode(tokenPayload);
    final signedJwt = signJwt(jwt, privateKey);

    final response = await http.post(
      Uri.parse('https://accounts.google.com/o/oauth2/token'),
      body: {
        'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
        'assertion': signedJwt,
      },
    ).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return error;
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final accessToken = responseData['access_token'];
      return accessToken;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
        //print('Failed to retrieve access token');
      }
      return 'Failed to retrieve access token';
    }
  }

  String signJwt(String payload, String privateKey) {
    final jwt = JWT(
      payload,
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
    );

    final token = jwt.sign(SecretKey(privateKey));

    if (kDebugMode) {
      print('Signed token: $token\n');
    }
    return token;
  }

  Future<bool> pushNotificationsAllUsers({
    required String title,
    required String body,
  }) async {
    final accessToken = await getAccessToken();

    var response = await http.post(
      Uri.parse(
          'https://fcm.googleapis.com/v1/projects/academic-calendar-2cbd4/messages:send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(
        {
          "message": {
            "topic": "events",
            "notification": {
              "title": "Breaking News",
              "body": "New news story available."
            },
            "data": {"story_id": "story_12345"},
            "android": {
              "notification": {"click_action": "TOP_STORY_ACTIVITY"}
            },
            "apns": {
              "payload": {
                "aps": {"category": "NEW_MESSAGE_CATEGORY"}
              }
            }
          }
        },
      ),
    );
    if (kDebugMode) {
      print(response.body.toString());
    }
    return true;
  }
}
