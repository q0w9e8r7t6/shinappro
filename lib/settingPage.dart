// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPage createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  final userUid = FirebaseAuth.instance.currentUser!.uid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nicknameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  String? gender;
  DateTime? birthday;
  String? religion;
  String? grade;
  String? residence;

  double margin = 0.12;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void loadUserInfo() async {
    final snapshot =
        await firestoreInstance.collection('users').doc(userUid).get();
    final data = snapshot.data() as Map<String, dynamic>;

    if (data['name'] != null) {
      nicknameController.text = data['name'];
    }
    if (data['sex'] != null) {
      setState(() {
        gender = data['sex'];
      });
    }
    if (data['birthday'] != null) {
      setState(() {
        birthday = data['birthday'].toDate();
      });
    }
    if (data['religion'] != null) {
      setState(() {
        religion = data['religion'];
      });
    }
    if (data['grade'] != null) {
      setState(() {
        grade = data['grade'];
      });
    }
    if (data['height'] != null) {
      heightController.text = data['height'].toString();
    }
    if (data['weight'] != null) {
      weightController.text = data['weight'].toString();
    }
    if (data['location'] != null) {
      setState(() {
        residence = data['location'];
      });
    }
  }

  // 이곳에 필요한 ValueNotifier 또는 ChangeNotifier를 추가 .. ?

  @override
  void dispose() {
    nicknameController.dispose();
    heightController.dispose();
    weightController.dispose();

    super.dispose();
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
                  Text(
                    // 어떤 문구를 달면 좋을까?
                    "기본 정보를 입력해주세요.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "인적 사항 설정",
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
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('닉네임',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: nicknameController,
                            decoration: const InputDecoration(
                                labelText: '여러분을 묘사해보세요.'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '닉네임을 입력해주세요.';
                              }
                              if (!RegExp(r'^[a-zA-Z가-힣]+$').hasMatch(value)) {
                                return '영어와 한국어로만 구성된 닉네임을 사용해주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('성별',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: gender,
                            items: <String>['남성', '여성']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                gender = newValue!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '성별을 선택해주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('생일',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: TextEditingController(
                                text: birthday == null
                                    ? ''
                                    : DateFormat('yyyy-MM-dd')
                                        .format(birthday!)),
                            readOnly: true,
                            onTap: () async {
                              final datePicked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());
                              if (datePicked != null &&
                                  datePicked != birthday) {
                                setState(() {
                                  birthday = datePicked;
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '생일을 선택해주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('종교',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: religion,
                            items: <String>['무교', '기독교', '불교', '천주교', '힌두교']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                religion = newValue!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '종교를 선택해주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('학년',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: grade,
                            items: <String>['1학년', '2학년', '3학년', '4학년']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                grade = newValue!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '학년을 선택해주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('키',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: heightController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '키를 입력해주세요.';
                              }
                              double? parsedValue = double.tryParse(value);
                              if (parsedValue == null || parsedValue <= 0) {
                                return '유효한 키 값을 입력해주세요.';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: '키는 센티미터(cm) 단위입니다.'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('몸무게',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: weightController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '몸무게를 입력해주세요.';
                              }
                              double? parsedValue = double.tryParse(value);
                              if (parsedValue == null || parsedValue <= 0) {
                                return '유효한 몸무게 값을 입력해주세요.';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: '몸무게는 킬로그램(kg) 단위입니다.'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * margin,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: Text('거주지',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: residence,
                            items: <String>[
                              "서울특별시",
                              "부산광역시",
                              "대구광역시",
                              "인천광역시",
                              "광주광역시",
                              "대전광역시",
                              "울산광역시",
                              "세종특별자치시",
                              "경기도",
                              "강원도",
                              "충청북도",
                              "충청남도",
                              "전라북도",
                              "전라남도",
                              "경상북도",
                              "경상남도",
                              "제주특별자치도"
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() => residence = newValue!);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '거주지를 선택해주세요.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          await firestoreInstance
                              .collection('users')
                              .doc(userUid)
                              .set({
                            'name': nicknameController.text,
                            'sex': gender,
                            'birthday': birthday,
                            'religion': religion,
                            'grade': grade,
                            'height': double.parse(heightController.text),
                            'weight': double.parse(weightController.text),
                            'location': residence,
                          }, SetOptions(merge: true));
                        }
                        // 변경사항이 저장되었다는 메시지를 스낵바로 표시
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("변경사항이 저장되었습니다!"),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // 페이지 닫기
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
