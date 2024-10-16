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
    apiKey: 'AIzaSyDpm8Q-uaQnzg5hlCvde1-SJIaaCG1DWM8',
    appId: '1:973396217078:web:9722c56557017419c3b0d7',
    messagingSenderId: '973396217078',
    projectId: 'communityhub-4ccd6',
    authDomain: 'communityhub-4ccd6.firebaseapp.com',
    storageBucket: 'communityhub-4ccd6.appspot.com',
    measurementId: 'G-T6VV1QY14D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnmO5bhI4oMbksC4KEslNKSQThZDEn3Sw',
    appId: '1:973396217078:android:b15ed2250ce9f350c3b0d7',
    messagingSenderId: '973396217078',
    projectId: 'communityhub-4ccd6',
    storageBucket: 'communityhub-4ccd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDh7y2L2tEdgvHO9N9RU8XR0dyYy8QnwiU',
    appId: '1:973396217078:ios:65a5f0b8a9912c96c3b0d7',
    messagingSenderId: '973396217078',
    projectId: 'communityhub-4ccd6',
    storageBucket: 'communityhub-4ccd6.appspot.com',
    iosBundleId: 'com.example.communityHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDh7y2L2tEdgvHO9N9RU8XR0dyYy8QnwiU',
    appId: '1:973396217078:ios:65a5f0b8a9912c96c3b0d7',
    messagingSenderId: '973396217078',
    projectId: 'communityhub-4ccd6',
    storageBucket: 'communityhub-4ccd6.appspot.com',
    iosBundleId: 'com.example.communityHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpm8Q-uaQnzg5hlCvde1-SJIaaCG1DWM8',
    appId: '1:973396217078:web:d3bde35096d3d113c3b0d7',
    messagingSenderId: '973396217078',
    projectId: 'communityhub-4ccd6',
    authDomain: 'communityhub-4ccd6.firebaseapp.com',
    storageBucket: 'communityhub-4ccd6.appspot.com',
    measurementId: 'G-DHLSD3V3CZ',
  );
}