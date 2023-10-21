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
    apiKey: 'AIzaSyB82GyT6DYY3JgwgWN7rK8U3SDG1i4Flpw',
    appId: '1:1050751994416:web:f6fb640d9d9757e8eabbf5',
    messagingSenderId: '1050751994416',
    projectId: 'authtutorial-d86ec',
    authDomain: 'authtutorial-d86ec.firebaseapp.com',
    storageBucket: 'authtutorial-d86ec.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwboxFw2tbSHxbHfVHQrOrLbqoprP8RUQ',
    appId: '1:1050751994416:android:12b532c55d040347eabbf5',
    messagingSenderId: '1050751994416',
    projectId: 'authtutorial-d86ec',
    storageBucket: 'authtutorial-d86ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgUdRvTik0HZOiC_l9Pz8Iz9H583PcQrI',
    appId: '1:1050751994416:ios:bbd64e2307a78c24eabbf5',
    messagingSenderId: '1050751994416',
    projectId: 'authtutorial-d86ec',
    storageBucket: 'authtutorial-d86ec.appspot.com',
    iosBundleId: 'com.example.logIn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgUdRvTik0HZOiC_l9Pz8Iz9H583PcQrI',
    appId: '1:1050751994416:ios:36ecf25cde271be3eabbf5',
    messagingSenderId: '1050751994416',
    projectId: 'authtutorial-d86ec',
    storageBucket: 'authtutorial-d86ec.appspot.com',
    iosBundleId: 'com.example.logIn.RunnerTests',
  );
}
