// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './habitPage.dart';
import './mainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addUserToFirestore(UserCredential userCredential) async {
    final docRef = _firestore.collection('users').doc(userCredential.user!.uid);

    if (userCredential.additionalUserInfo!.isNewUser) {
      final userData = {
        'uid': userCredential.user!.uid,
        'habitSet': false,
      };
      userData['name'] = userCredential.user!.displayName!;
      await docRef.set(userData);
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10 * 1.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10 * 2,
            child: Image.asset("assets/image/logo.jpg"),
          ),
          Container(
              //height: MediaQuery.of(context).size.width/10,
              height: 50),
          Text(
            "SHIN\nAPRO",
            style: GoogleFonts.pressStart2p(
              fontSize: 40,
              color: const Color(0xff7D5A50),
            ),
          ),
          Container(
              //height: MediaQuery.of(context).size.width/10,
              height: 5),
          const Text("시나브로 변해가는 나의 습관"),
          Container(
            //height: MediaQuery.of(context).size.width/10,
            height: MediaQuery.of(context).size.height / 10 * 1.5,
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,

            onTap: () async {
              final userCredential = await signInWithGoogle();
              if (userCredential != null) {
                final docRef = _firestore
                    .collection('users')
                    .doc(userCredential.user!.uid);
                final docSnapshot = await docRef.get();
                final habitSet = docSnapshot.data()?['habitSet'] ?? false;
                if (!habitSet) {
                  await addUserToFirestore(userCredential);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HabitPage()));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainPage()));
                }
              } else {
                print("login Error");
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 10 * 0.7,
              width: MediaQuery.of(context).size.width / 10 * 4,
              decoration: BoxDecoration(
                color: Colors.white,
                //color: const Color(0xffFEF6EF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    offset: const Offset(1, 1),
                    blurRadius: 1.5,
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  "Google Log in",
                  style: TextStyle(
                    color: Color(0xff7D5A50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 25),
            child: const Text(
              "Academic Society of Addiction and Rehabilitation Research",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
