import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shinappro/firebase_options.dart';
import './loginPage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
        /*name: "Shinappro",
        options: const FirebaseOptions(
          apiKey: "AIzaSyB0PO8P2du80hp6hNKnIHxWdgcw-JeCDCM",
          appId: "edu.handong.ASARR.shinappro",
          messagingSenderId: "540450109795",
          projectId: "shinappro-aadb2",
          authDomain: "shinappro-aadb2.firebaseapp.com",
          storageBucket: "shinappro-aadb2.appspot.com",
        )*/);
    runApp(const MyApp());
  } catch (e) {
    // ignore: avoid_print
    print("Firebase initialization error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      title: 'SHINAPPRO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // ignore: prefer_const_constructors
      home: LoginPage(),
    );
  }
}