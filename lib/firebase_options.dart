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
    apiKey: 'AIzaSyBzl9nso9epQk2pC9nPto8QhykzT2vkwrA',
    appId: '1:320079447747:web:febcb05ca076a35f5d8476',
    messagingSenderId: '320079447747',
    projectId: 'carteiraestudante-e7fcd',
    authDomain: 'carteiraestudante-e7fcd.firebaseapp.com',
    storageBucket: 'carteiraestudante-e7fcd.appspot.com',
    measurementId: 'G-TL21KBH5FG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVCYFrgeZjIgW9FtCcc-QHW8-vWUvmNhM',
    appId: '1:320079447747:android:78553183bbce04c55d8476',
    messagingSenderId: '320079447747',
    projectId: 'carteiraestudante-e7fcd',
    storageBucket: 'carteiraestudante-e7fcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGeJCweO_Zt7R5P6BUY2DqTGSbXKc1nZc',
    appId: '1:320079447747:ios:03c0528ed9cda86a5d8476',
    messagingSenderId: '320079447747',
    projectId: 'carteiraestudante-e7fcd',
    storageBucket: 'carteiraestudante-e7fcd.appspot.com',
    iosClientId: '320079447747-oquurklmpvd9ia89o4cp2dsude5of5ec.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGeJCweO_Zt7R5P6BUY2DqTGSbXKc1nZc',
    appId: '1:320079447747:ios:03c0528ed9cda86a5d8476',
    messagingSenderId: '320079447747',
    projectId: 'carteiraestudante-e7fcd',
    storageBucket: 'carteiraestudante-e7fcd.appspot.com',
    iosClientId: '320079447747-oquurklmpvd9ia89o4cp2dsude5of5ec.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );
}
