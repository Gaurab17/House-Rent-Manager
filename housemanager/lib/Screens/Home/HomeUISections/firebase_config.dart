import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    /// if you want configuration for web from here
    /// and fill your data from web's google-services.json file ///
    // if (kIsWeb) {
    //   // Web
    //   return const FirebaseOptions(
    //     apiKey: '',
    //     authDomain: '',
    //     databaseURL:'',
    //     projectId: '',
    //     storageBucket: '',
    //     messagingSenderId: '',
    //     appId: '',
    //     measurementId: '',
    //   );

    /// also if you wont configuration for IOS from here
    /// and fill your data from IOS's google-services.json file ///
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   return const FirebaseOptions(
    //     apiKey: '',
    //     authDomain: '',
    //     databaseURL:'',
    //     projectId: '',
    //     storageBucket: '',
    //     messagingSenderId: '',
    //     appId: '',
    //     measurementId: '',
    //   );
    // } else {
    //   // Android

    /// To do change your data from google-services.json file ///
    /// in this configuration we work for android only  ///
    return const FirebaseOptions(
      appId: "1:603530372941:android:c164121dbce31411363904",
      apiKey: "AIzaSyBFiJaAE61GD_uXMHCTGf67BJUS_5SsIIU",
      projectId: "house-rent-manager",
      androidClientId:
      "603530372941-sushipue301tsp4or3cidp76i5pjhm2l.apps.googleusercontent.com",
      // we can find it from firebase/project setting /  Cloud Messaging
      messagingSenderId: '603530372941',
      // we can find it from firebase/ Authentication /Sign-in method
      authDomain: 'house-rent-manager.firebaseapp.com',
    );
    // }
  }
}
