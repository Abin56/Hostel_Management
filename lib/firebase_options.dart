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
    apiKey: 'AIzaSyBPaQ4Ga-d_wTd9pCiU_kMTllMeuVblSP0',
    appId: '1:512252187081:web:29a9843fc66f17bc6f5818',
    messagingSenderId: '512252187081',
    projectId: 'leptondujokerala',
    authDomain: 'leptondujokerala.firebaseapp.com',
    databaseURL: 'https://leptondujokerala-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'leptondujokerala.appspot.com',
    measurementId: 'G-QC6SR6TLE0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPYQ232se8EQjwRWXEyrpD6S280gIWh1w',
    appId: '1:512252187081:android:ee68c26eff92df286f5818',
    messagingSenderId: '512252187081',
    projectId: 'leptondujokerala',
    databaseURL: 'https://leptondujokerala-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'leptondujokerala.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6NLxGfZp2jQxtGXWH-rlNb0zmguZYK-8',
    appId: '1:512252187081:ios:5a1135ae6d71f8946f5818',
    messagingSenderId: '512252187081',
    projectId: 'leptondujokerala',
    databaseURL: 'https://leptondujokerala-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'leptondujokerala.appspot.com',
    androidClientId: '512252187081-oukpm7hd2rj5ibudeeaduk8eed0j8tge.apps.googleusercontent.com',
    iosClientId: '512252187081-386ln3u3gd4vtsir84bbvpvcfnhaur29.apps.googleusercontent.com',
    iosBundleId: 'com.example.hostManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6NLxGfZp2jQxtGXWH-rlNb0zmguZYK-8',
    appId: '1:512252187081:ios:5a1135ae6d71f8946f5818',
    messagingSenderId: '512252187081',
    projectId: 'leptondujokerala',
    databaseURL: 'https://leptondujokerala-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'leptondujokerala.appspot.com',
    androidClientId: '512252187081-oukpm7hd2rj5ibudeeaduk8eed0j8tge.apps.googleusercontent.com',
    iosClientId: '512252187081-386ln3u3gd4vtsir84bbvpvcfnhaur29.apps.googleusercontent.com',
    iosBundleId: 'com.example.hostManagement',
  );
}
