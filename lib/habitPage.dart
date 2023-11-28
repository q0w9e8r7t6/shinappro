import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shinappro/mainPage.dart';

class HabitPage extends StatefulWidget {
  const HabitPage({super.key});

  @override
  _HabitPage createState() => _HabitPage();
}

class _HabitPage extends State<HabitPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  String? badHabit;
  String? goodHabit;

  @override
  void initState() {
    super.initState();
    loadHabits();
  }

  void loadHabits() async {
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final habitMap = {
      '3': '스마트폰 과의존',
      '4': 'SNS 과의존',
      '5': '게임 중독',
      '6': '유튜브 과의존',
      '7': '온라인 쇼핑 중독',
      '8': '공부 습관',
      '9': '운동 습관',
      '10': '수면 습관',
    };

    final snapshot =
        await firestoreInstance.collection('users').doc(userUid).get();
    final data = snapshot.data() as Map<String, dynamic>;

    if (data['badHabit'] != null) {
      setState(() {
        badHabit = habitMap[data['badHabit']];
      });
    }
    if (data['goodHabit'] != null) {
      setState(() {
        goodHabit = habitMap[data['goodHabit']];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /**
             * 인사글 섹션
             */
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "습관 설정",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff7D5A50)),
                      ),
                      Text(
                        "  page",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    // 어떤 문구를 달면 좋을까?
                    "다루고 싶은 습관을 선택하세요",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Spacer(),
            /**
             * 뒤로 가기
             */
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: badHabit,
                items: <String>[
                  '스마트폰 과의존',
                  'SNS 과의존',
                  '게임 중독',
                  '유튜브 과의존',
                  '온라인 쇼핑 중독',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    badHabit = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: '개선하고 싶은 습관'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              DropdownButtonFormField<String>(
                value: goodHabit,
                items: <String>['공부 습관', '운동 습관', '수면 습관']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    goodHabit = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: '발전하고 싶은 습관'),
              ),
              ElevatedButton(
                child: const Text('저장하기'),
                onPressed: () async {
                  if (badHabit == null || goodHabit == null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('알림'),
                          content: const Text('습관을 모두 선택해주세요.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('확인'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    final userUid = FirebaseAuth.instance.currentUser!.uid;
                    final habitMap = {
                      '스마트폰 과의존': '3',
                      'SNS 과의존': '4',
                      '게임 중독': '5',
                      '유튜브 과의존': '6',
                      '온라인 쇼핑 중독': '7',
                      '공부 습관': '8',
                      '운동 습관': '9',
                      '수면 습관': '10',
                    };

                    await firestoreInstance
                        .collection('users')
                        .doc(userUid)
                        .update({
                      'badHabit': habitMap[badHabit],
                      'goodHabit': habitMap[goodHabit],
                      'habitSet': true,
                    });

                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("변경사항이 저장되었습니다!"),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MainPage()), 
                      (Route<dynamic> route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
