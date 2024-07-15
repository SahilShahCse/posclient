import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOrHCQw8T4gamYZ74gZjaqoz6F7IrjrCE",
            authDomain: "pos-parkin-293b5.firebaseapp.com",
            projectId: "pos-parkin-293b5",
            storageBucket: "pos-parkin-293b5.appspot.com",
            messagingSenderId: "529395063027",
            appId: "1:529395063027:web:86a4c73461ea94cfaaff86",
            measurementId: "G-6Y1GP9TH8E"));
  } else {
    await Firebase.initializeApp();
  }
}
