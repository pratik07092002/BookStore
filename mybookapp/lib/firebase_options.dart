// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCvFd3qwCY4B1_3p2YiWeEk-BQ78I6NcE0',
    appId: '1:1057451982064:web:6cf8627bd72f24177bd635',
    messagingSenderId: '1057451982064',
    projectId: 'libraryapp-56bf7',
    authDomain: 'libraryapp-56bf7.firebaseapp.com',
    storageBucket: 'libraryapp-56bf7.appspot.com',
    measurementId: 'G-MZGKM7FW3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBS5YuIv-XI2zNyT7zkQxgQBG4NZf3H9uc',
    appId: '1:1057451982064:android:2775117c6092a5407bd635',
    messagingSenderId: '1057451982064',
    projectId: 'libraryapp-56bf7',
    storageBucket: 'libraryapp-56bf7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZMvZ1lEMo65V7Dcq1jb8OxvIY1YeVmzM',
    appId: '1:1057451982064:ios:8b650533e02a41a17bd635',
    messagingSenderId: '1057451982064',
    projectId: 'libraryapp-56bf7',
    storageBucket: 'libraryapp-56bf7.appspot.com',
    iosBundleId: 'com.example.mybookapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZMvZ1lEMo65V7Dcq1jb8OxvIY1YeVmzM',
    appId: '1:1057451982064:ios:8b650533e02a41a17bd635',
    messagingSenderId: '1057451982064',
    projectId: 'libraryapp-56bf7',
    storageBucket: 'libraryapp-56bf7.appspot.com',
    iosBundleId: 'com.example.mybookapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvFd3qwCY4B1_3p2YiWeEk-BQ78I6NcE0',
    appId: '1:1057451982064:web:72ce5714e61ecd047bd635',
    messagingSenderId: '1057451982064',
    projectId: 'libraryapp-56bf7',
    authDomain: 'libraryapp-56bf7.firebaseapp.com',
    storageBucket: 'libraryapp-56bf7.appspot.com',
    measurementId: 'G-BNXP505C57',
  );

}