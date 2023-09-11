// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC1JwxWzyjQ2-_RHrnlN7j0dWVf8EfyKAQ',
    appId: '1:802440191160:web:0a9021e0b670cd8b62e84d',
    messagingSenderId: '802440191160',
    projectId: 'academic-calendar-2cbd4',
    authDomain: 'academic-calendar-2cbd4.firebaseapp.com',
    storageBucket: 'academic-calendar-2cbd4.appspot.com',
    measurementId: 'G-23FJH0SN3X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu5QxsFni-2SVTbEXX4KU0UREfWrJRy4c',
    appId: '1:802440191160:android:2e5d529d34f6098762e84d',
    messagingSenderId: '802440191160',
    projectId: 'academic-calendar-2cbd4',
    storageBucket: 'academic-calendar-2cbd4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAImfEm6SzCiMb-hzh19rjxkAgFd9hFZ5s',
    appId: '1:802440191160:ios:a05973250bb5ac0f62e84d',
    messagingSenderId: '802440191160',
    projectId: 'academic-calendar-2cbd4',
    storageBucket: 'academic-calendar-2cbd4.appspot.com',
    iosClientId: '802440191160-pv6cuc2jkhga08b16gc5ulu8pkkhktkp.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendarApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAImfEm6SzCiMb-hzh19rjxkAgFd9hFZ5s',
    appId: '1:802440191160:ios:6dbffb92e33ab5e262e84d',
    messagingSenderId: '802440191160',
    projectId: 'academic-calendar-2cbd4',
    storageBucket: 'academic-calendar-2cbd4.appspot.com',
    iosClientId: '802440191160-5nmrpghqt69duidbeit56ourfk28c4r6.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendarApp.RunnerTests',
  );
}
