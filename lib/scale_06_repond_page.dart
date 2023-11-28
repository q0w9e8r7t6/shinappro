import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:research_package/research_package.dart';
import 'scale_06_objects.dart';
import 'dart:convert';

// ignore: must_be_immutable
class Scale06Page extends StatelessWidget {
  Scale06Page({super.key});

  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);

  final firestoreInstance = FirebaseFirestore.instance;
  final userUid = FirebaseAuth.instance.currentUser!.uid;
  int i = 1;
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> printWrapped(String text) async {
    //final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    //final pattern = RegExp('\n     "value": .'); // 800 is the size of each chunk

    final pattern =
        RegExp('(?<=\n     "value": )[0-9.]+'); // 800 is the size of each chunk

    var matches = pattern.allMatches(text).toList();

    for (var match in matches) {
      int parsedValue = int.tryParse(match.group(0) ?? '0') ?? 0;
      await firestoreInstance
          .collection('users')
          .doc(userUid)
          .collection("6")
          .doc(today)
          .set({
        '$i': parsedValue,
      }, SetOptions(merge: true));
      i++;
    }
  }

  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    printWrapped(_encode(result));
  }

  void cancelCallBack(RPTaskResult result) {
    // Do anything with the result at the moment of the cancellation
    print("The result so far:\n" + _encode(result));
  }

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: linearSurveyTask,
      onSubmit: resultCallback,
      onCancel: (RPTaskResult? result) {
        if (result == null) {
          print("No result");
        } else
          cancelCallBack(result);
      },
    );
  }
}
