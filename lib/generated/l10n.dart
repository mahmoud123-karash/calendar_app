// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ``
  String get title {
    return Intl.message(
      '',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get myevent {
    return Intl.message(
      '',
      name: 'myevent',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get theme {
    return Intl.message(
      '',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get date {
    return Intl.message(
      '',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get event {
    return Intl.message(
      '',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventname {
    return Intl.message(
      '',
      name: 'eventname',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventdate {
    return Intl.message(
      '',
      name: 'eventdate',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventde {
    return Intl.message(
      '',
      name: 'eventde',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get noevents {
    return Intl.message(
      '',
      name: 'noevents',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get evente {
    return Intl.message(
      '',
      name: 'evente',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventd {
    return Intl.message(
      '',
      name: 'eventd',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get eventa {
    return Intl.message(
      '',
      name: 'eventa',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get validate {
    return Intl.message(
      '',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get add {
    return Intl.message(
      '',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get addevent {
    return Intl.message(
      '',
      name: 'addevent',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get message {
    return Intl.message(
      '',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get settings {
    return Intl.message(
      '',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get contact {
    return Intl.message(
      '',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get share {
    return Intl.message(
      '',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get notification {
    return Intl.message(
      '',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get email {
    return Intl.message(
      '',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get app {
    return Intl.message(
      '',
      name: 'app',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get noti {
    return Intl.message(
      '',
      name: 'noti',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get themes {
    return Intl.message(
      '',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get sub {
    return Intl.message(
      '',
      name: 'sub',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get unsub {
    return Intl.message(
      '',
      name: 'unsub',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get nomyevents {
    return Intl.message(
      '',
      name: 'nomyevents',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get permisd {
    return Intl.message(
      '',
      name: 'permisd',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ok {
    return Intl.message(
      '',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get no {
    return Intl.message(
      '',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
