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
    apiKey: 'AIzaSyDk7hwkNOEyUwwnDXbV-vx8URwGbmE7T3A',
    appId: '1:427226943888:web:0811cbdd1e8dba32c56315',
    messagingSenderId: '427226943888',
    projectId: 'expense-tracker-e0fb6',
    authDomain: 'expense-tracker-e0fb6.firebaseapp.com',
    storageBucket: 'expense-tracker-e0fb6.appspot.com',
    measurementId: 'G-PZCRHGLDZD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5pK2NngqLJpecM3xchkInlsCKEF49OFA',
    appId: '1:427226943888:android:8973fe913da9d2a9c56315',
    messagingSenderId: '427226943888',
    projectId: 'expense-tracker-e0fb6',
    storageBucket: 'expense-tracker-e0fb6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCogu2anc8GvJHLGloGzyzk33fDKOzBzxE',
    appId: '1:427226943888:ios:d9e2a8d9807537ddc56315',
    messagingSenderId: '427226943888',
    projectId: 'expense-tracker-e0fb6',
    storageBucket: 'expense-tracker-e0fb6.appspot.com',
    iosBundleId: 'com.example.expenseTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCogu2anc8GvJHLGloGzyzk33fDKOzBzxE',
    appId: '1:427226943888:ios:d9e2a8d9807537ddc56315',
    messagingSenderId: '427226943888',
    projectId: 'expense-tracker-e0fb6',
    storageBucket: 'expense-tracker-e0fb6.appspot.com',
    iosBundleId: 'com.example.expenseTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDk7hwkNOEyUwwnDXbV-vx8URwGbmE7T3A',
    appId: '1:427226943888:web:3464f7557190abb2c56315',
    messagingSenderId: '427226943888',
    projectId: 'expense-tracker-e0fb6',
    authDomain: 'expense-tracker-e0fb6.firebaseapp.com',
    storageBucket: 'expense-tracker-e0fb6.appspot.com',
    measurementId: 'G-FW8QMCTWKL',
  );
}