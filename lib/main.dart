// ignore_for_file: depend_on_referenced_packages
import 'package:calendar_app/cubit/calendar_cubit.dart';
import 'package:calendar_app/cubit/calendar_states.dart';
import 'package:calendar_app/layout/Layout_screen.dart';
import 'package:calendar_app/models/notification_service.dart';
import 'package:calendar_app/models/shared_preference.dart';
import 'package:calendar_app/shared/bloc_observer.dart';
import 'package:calendar_app/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calendar_app/generated/l10n.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  tz.initializeTimeZones();
  NotificationService().initiNotification();
  Bloc.observer = MyBlocObserver();
  await cache_helper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalendarCubit()
            ..changeAppTheme(fromSP: cache_helper.getData(key: 'isdark'))
            ..getEvents()
            ..getBanners()
            ..openDataBase()
            ..subAndUnSub(fromSP: cache_helper.getData(key: 'sub')),
        )
      ],
      child: BlocBuilder<CalendarCubit, CalendarStates>(
        builder: (context, state) {
          bool isdark = CalendarCubit.get(context).isdark;

          return MaterialApp(
            locale: const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: isdark ? darkmode : lightmode,
            home: const LayoutScreen(),
          );
        },
      ),
    );
  }
}
