// ignore_for_file: unnecessary_null_comparison
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:calendar_app/models/banner_model.dart';
import 'package:calendar_app/models/event_model.dart';
import 'package:calendar_app/models/notification_service.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/shared/components.dart';
import 'package:calendar_app/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarCubit extends Cubit<CalendarStates> {
  CalendarCubit() : super(InitailCalendarState());
  static CalendarCubit get(context) => BlocProvider.of(context);

  bool isdark = true;
  void changeAppTheme({bool? fromSP}) {
    if (fromSP != null) {
      isdark = fromSP;
    } else {
      isdark = !isdark;
      cache_helper.saveData(key: 'isdark', value: isdark);
    }
    emit(ChangeAppThemeState());
  }

  bool sub = false;
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
}
