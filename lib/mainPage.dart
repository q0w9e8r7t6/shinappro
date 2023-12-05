// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:math';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

import 'scale_01_repond_page.dart';
import 'scale_02_repond_page.dart';
import 'scale_03_repond_page.dart';
import 'scale_04_repond_page.dart';
import 'scale_05_repond_page.dart';
import 'scale_06_repond_page.dart';
import 'scale_07_repond_page.dart';
import 'scale_08_repond_page.dart';
import 'scale_09_repond_page.dart';
import 'scale_10_repond_page.dart';
import './settingPage.dart';
import './habitPage.dart';

Future<void> listSet(List<double> list, String code) async {
  list.clear();
  QuerySnapshot snapshots = await FirebaseFirestore.instance
      .collection('users')
      .doc(userUid)
      .collection(code)
      .get();

  switch (code) {
    case '1':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 16; i++) {
          dataSum += (data['$i'] ?? 0) as int;
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '2':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 10; i++) {
          if (i == 1 || i == 2 || i == 3 || i == 9 || i == 10) {
            dataSum += (data['$i'] ?? 0) as int;
          } else {
            dataSum += (4 - (data['$i'] ?? 0) as int);
          }
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '3':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 15; i++) {
          if (i == 4 || i == 10 || i == 15) {
            dataSum += (6 - (data['$i'] ?? 0) as int);
          } else {
            dataSum += (data['$i'] ?? 0) as int;
          }
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '4':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 24; i++) {
          if (i == 9) {
            dataSum += (5 - (data['$i'] ?? 0) as int);
          } else {
            dataSum += (data['$i'] ?? 0) as int;
          }
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }

    case '5':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 20; i++) {
          dataSum += (data['$i'] ?? 0) as int;
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '6':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 22; i++) {
          dataSum += (data['$i'] ?? 0) as int;
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '7':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 15; i++) {
          dataSum += (data['$i'] ?? 0) as int;
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '8':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 16; i++) {
          if (i == 11) {
            dataSum += (6 - (data['$i'] ?? 0) as int);
          } else {
            dataSum += (data['$i'] ?? 0) as int;
          }
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '9':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 12; i++) {
          dataSum += (data['$i'] ?? 0) as int;
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    case '10':
      for (var doc in snapshots.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        double dataSum = 0;
        for (int i = 1; i <= 10; i++) {
          dataSum += (data['$i'] ?? 0) as int;
        }
        // 리스트에 dataSum 값을 추가
        list.add(dataSum);
      }
    default:
      return;
  }
}

// 표준화 회귀계수를 계산하는 함수
Future<Map<String, double>> calculateR(String code) async {
  // 변수 선언
  List<double> x1 = [];
  List<double> x2 = [];
  List<double> y = [];
  await listSet(x1, "1");
  await listSet(x2, "2");
  await listSet(y, code);

  if (x1.length < 3) {
    return {
      'rSquared': 999,
      'tBeta1': 999,
      'tBeta2': 999,
      'Beta1': 999,
      'Beta2': 999
    };
  }

  // 독립 변수와 종속 변수의 상관계수 계산
  double rX1Y = calculateCorrelationCoefficient(x1, y);
  double rX2Y = calculateCorrelationCoefficient(x2, y);
  double rX1X2 = calculateCorrelationCoefficient(x1, x2);
  print("X: $x1, Y: $y, $rX1Y");

  // 표준화 회귀계수 계산
  double beta1 = (rX1Y - rX2Y * rX1X2) / (1 - pow(rX1X2, 2));
  double beta2 = (rX2Y - rX1Y * rX1X2) / (1 - pow(rX1X2, 2));

  List<double> yPred = [];
  for (int i = 0; i < x1.length; i++) {
    yPred.add(beta1 * x1[i] + beta2 * x2[i]);
  }

  // R-squared 계산
  double ssr = 0;
  double sst = 0;
  double meanY = y.reduce((a, b) => a + b) / y.length;
  for (int i = 0; i < y.length; i++) {
    ssr += pow(y[i] - yPred[i], 2);
    sst += pow(y[i] - meanY, 2);
  }
  double rSquared = 1 - (ssr / sst);

  // t-검정: 다중회귀식
  double meanX1 = x1.reduce((a, b) => a + b) / x1.length;
  double seBeta1 = sqrt(ssr / (x1.length - 2)) /
      sqrt(x1.map((val) => pow(val - meanX1, 2)).reduce((a, b) => a + b));
  double tBeta1 = beta1 / seBeta1;

  double meanX2 = x2.reduce((a, b) => a + b) / x2.length;
  double seBeta2 = sqrt(ssr / (x2.length - 2)) /
      sqrt(x2.map((val) => pow(val - meanX2, 2)).reduce((a, b) => a + b));
  double tBeta2 = beta2 / seBeta2;

  // t-검정: 상관
  double tX1Y = rX1Y*sqrt(x1.length-2)/sqrt(1-pow(rX1Y,2));
  double tX2Y = rX2Y*sqrt(x2.length-2)/sqrt(1-pow(rX2Y,2));
  double tX1X2 = rX1X2*sqrt(x1.length-2)/sqrt(1-pow(rX1X2,2));

  // 결과를 맵에 담아 리턴
  return {
    'rSquared': rSquared,
    'tBeta1': tBeta1,
    'tBeta2': tBeta2,
    'Beta1': beta1,
    'Beta2': beta2,
    'rx1y': rX1Y,
    'rx2y': rX2Y,
    'rx1x2': rX1X2,
    'tx1y': tX1Y,
    'tx2y': tX2Y,
    'tx1x2': tX1X2
  };
}

Future<void> explain() async {
  Map<String, double> goodResult = await calculateR(goodHabit);
  Map<String, double> badResult = await calculateR(badHabit);

  String goodname = "";
  String badname = "";

  if (badHabit == "3") {
    badname = "스마트폰 과의존";
  } else if (badHabit == "4") {
    badname = "SNS 중독 경향성";
  } else if (badHabit == "5") {
    badname = "게임 중독";
  } else if (badHabit == "6") {
    badname = "유튜브 과의존";
  } else if (badHabit == "7") {
    badname = "온라인 쇼핑 중독";
  }

  if (goodHabit == "8") {
    goodname = "학습 습관";
  } else if (goodHabit == "9") {
    goodname = "운동 습관";
  } else if (goodHabit == "10") {
    goodname = "수면 습관";
  }

  script = "";
  double? badt1 = badResult['tBeta1'];
  double? badt2 = badResult['tBeta2'];
  double? badR2 = badResult['rSquared']! * 100;
  double? badb1 = badResult['Beta1'];
  double? badb2 = badResult['Beta2'];

  double? goodt1 = goodResult['tBeta1'];
  double? goodt2 = goodResult['tBeta2'];
  double? goodR2 = goodResult['rSquared']! * 100;
  double? goodb1 = goodResult['Beta1'];
  double? goodb2 = goodResult['Beta2'];

  double? motivBad = badResult['rx1y'];
  double? stressBad = badResult['rx2y'];
  double? motivstress = badResult['rx1x2'];
  double? motivGood = goodResult['rx1y'];
  double? stressGood = goodResult['rx2y'];
//  double? motivStress2 = goodResult['rx1x2'];
//  print("상관계수 비교해보자 $motivstress, $motivStress2"); 동일함.
  double? motivbadt = badResult['tx1y'];
  double? stressbadt = badResult['tx2y'];
  double? motivgoodt = badResult['tx1x2'];
  double? stressgoodt = goodResult['tx1y'];
  double? motivstresst = goodResult['tx1y'];
//  double? motivgoodt2 = goodResult['tx1x2'];
//  print("t값 비교해보자 $motivgoodt, $motivgoodt2"); 동일함

  if (goodR2! > 998.0) {
    print("여기로 오나요?");
    script = "더 많은 수의 데이터가 필요합니다. 설문을 실시해주세요 ~";
    return;
  }

  if (badR2! > 20) {
    script +=
        "귀하가 개선하고 싶은 $badname을 동기균형과 스트레스가 $badR2% 설명해주고 있습니다.\n\n하나하나 살펴보도록 하죠\n\n";

    if (badt1! < 2.0) {
      script +=
          "$badname에 대한 동기균형의 영향력은 유의미하지 않은 것으로 나타났습니다. 유의미한 관계를 파악하기 위해서는 더 많은 데이터가 필요합니다.\n\n";
    } else {
      script += "$badname에 대한 동기균형의 영향력은 유의미한 것으로 나타났습니다.\n\n";
      if (badb1! > 0) {
        script +=
            "동기균형이 높을수록 $badname이 심화되는 것으로 나타납니다. 일반적이지는 않은 경우인데, 증상의 감소를 위해서는 어느 하나의 동기를 충분히 키워 동기균형을 무너뜨릴 필요가 있습니다.\n\n";
      } else {
        script +=
            "동기균형이 낮을수록 $badname이 심화되는 것으로 나타납니다. 위 그래프 칸을 클릭하셔서, 권장되는 활동을 해보시는 것을 추천드립니다.\n\n";
      }
    }

    if (badt2! < 2.0) {
      script +=
          "$badname에 대한 스트레스의 영향력은 유의미하지 않은 것으로 나타났습니다. 유의미한 관계를 파악하기 위해서는 더 많은 데이터가 필요합니다.\n\n";
    } else {
      script += "$badname에 대한 스트레스의 영향력은 유의미한 것으로 나타났습니다.\n\n";
      if (badb2! > 0) {
        script +=
            "스트레스가 높을수록 $badname이 심화되는 것으로 나타납니다. ㅜㅜ 요새 힘드시죠? 좋아하는 일을 하면서 시간을 보내보는건 어떨까요?\n\n";
      } else {
        script +=
            "스트레스가 낮을수록 $badname이 심화되는 것으로 나타납니다. 일반적이지는 않은 경우인데, 편안함을 추구하지 않고 바쁘게 살려고 노력해보면 습관 개선에 도움이 될 수 있습니다.\n\n";
      }
    }
  } else {
    script +=
        "귀하의 $badname을 동기균형과 스트레스로 해석하기는 아직 어렵습니다. 동기균형과 스트레스와의 관계를 보고 싶으시다면 더 많은 데이터를 투입해주세요. 적어도 30일분량의 데이터가 권장됩니다.\n\n";
  }

  if (goodR2 > 20) {
    script +=
        "귀하가 개선하고 싶은 $goodname을 동기균형과 스트레스가 $goodR2% 설명해주고 있습니다.\n\n하나하나 살펴봐요\n\n";
    if (goodt1! < 2.0) {
      script +=
          "$goodname에 대한 동기균형의 영향력은 유의미하지 않은 것으로 나타났습니다. 유의미한 관계를 파악하기 위해서는 더 많은 데이터가 필요합니다.\n\n";
    } else {
      script += "$goodname에 대한 동기균형의 영향력은 유의미한 것으로 나타났습니다.\n\n";
      if (goodb1! > 0) {
        script +=
            "동기균형이 높을수록 $goodname이 좋아지는 것으로 나타납니다. 좋은 균형감을 유지하기 위해 종종 검사하시고 권장되는 활동을 진행해보세요!.\n\n";
      } else {
        script +=
            "동기균형이 낮을수록 $goodname이 좋아지는 것으로 나타납니다. 일반적이지는 않은데, 내 습관이 좋아질때 어떤 동기를 가지고 있는지 살펴보시고, 그와 잘 어울리는 행동을 통해 동기균형을 낮춰보시는걸 권장드립니다.\n\n";
      }
    }

    if (goodt2! < 2.0) {
      script +=
          "$goodname에 대한 스트레스의 영향력은 유의미하지 않은 것으로 나타났습니다. 유의미한 관계를 파악하기 위해서는 더 많은 데이터가 필요합니다.";
    } else {
      script += "$goodname에 대한 스트레스의 영향력은 유의미한 것으로 나타났습니다.\n\n";
      if (goodb2! > 0) {
        script +=
            "스트레스가 높을수록 $goodname이 좋아지는 것으로 나타납니다. 적당한 수준의 스트레스가 목표하고 있는 일에 도움을 주고 있는 것으로 보입니다.";
      } else {
        script +=
            "스트레스가 낮을수록 $goodname이 좋아지는 것으로 나타납니다. 스트레스가 높아지면 습관이 무너질 수 있으니 조심해요!";
      }
    }
  } else {
      script +=
        "귀하의 $goodname을 동기균형과 스트레스로 해석하기는 아직 어렵습니다. 동기균형과 스트레스와의 관계를 보고 싶으시다면 더 많은 데이터를 투입해주세요. 적어도 30일분량의 데이터가 권장됩니다.";
  }


  script += '''\n\n\n통계치는 다음과 같습니다.\n
  상관계수(pearson's r, t-value) 
  동기균형과 스트레스: ${motivstress?.toStringAsFixed(3)},${motivstresst?.toStringAsFixed(3)} 
  동기균형과 $badname: ${motivBad?.toStringAsFixed(3)}, ${motivbadt?.toStringAsFixed(3)}
  스트레스와 $badname: ${stressBad?.toStringAsFixed(3)}, ${stressbadt?.toStringAsFixed(3)}
  동기균형과 $goodname: ${motivGood?.toStringAsFixed(3)}, ${motivgoodt?.toStringAsFixed(3)}
  동기균형과 $goodname: ${stressGood?.toStringAsFixed(3)}, ${stressgoodt?.toStringAsFixed(3)}

  다중회귀모델의 설명력(R-squared*100)[X1: 동기균형, X2: 스트레스, Y: $badname]: ${badR2.toStringAsFixed(3)}%
  다중회귀모델 내 $badname에 대한 동기균형의 설명력(β): ${badb1?.toStringAsFixed(3)}
  $badname에 대한 동기균형의 설명력의 유의성(t-value): ${badt1?.toStringAsFixed(3)}
  다중회귀보델 내 $badname에 대한 스트레스의 설명력(β): ${badb2?.toStringAsFixed(3)}
  $badname에 대한 스트레스의 설명력의 유의성(t-value): ${badt2?.toStringAsFixed(3)}

  다중회귀모델의 설명력(R-squared*100)[X1: 동기균형, X2: 스트레스, Y: $goodname]: ${goodR2.toStringAsFixed(3)}%
  다중회귀모델 내 $goodname에 대한 동기균형의 설명력(β): ${goodb1?.toStringAsFixed(3)}
  $goodname에 대한 동기균형의 설명력의 유의성(t-value): ${goodt1?.toStringAsFixed(3)}
  다중회귀모델 내 $goodname에 대한 동기균형의 설명력(β): ${goodb1?.toStringAsFixed(3)}
  $goodname에 대한 스트레스의 설명력의 유의성(t-value): ${goodt2?.toStringAsFixed(3)}
  
  
  t-value 유의성 기준
  |t|>1.96 이면 p<.05
  |t|>2.576 이면 p<.01
  |t|>3.291 이면 p<.001
  ''';
  print(script);

  return;
}

// 상관계수를 계산하는 함수
double calculateCorrelationCoefficient(List<double> x, List<double> y) {
  double meanX = x.reduce((a, b) => a + b) / x.length;
  double meanY = y.reduce((a, b) => a + b) / y.length;

  double covXY = 0;
  for (int i = 0; i < x.length; i++) {
    covXY += (x[i] - meanX) * (y[i] - meanY);
  }
  covXY /= x.length; // covXY 값을 x.length로 나누어줌

  double stdDevX = sqrt(
      x.map((val) => pow(val - meanX, 2)).reduce((a, b) => a + b) / x.length);
  double stdDevY = sqrt(
      y.map((val) => pow(val - meanY, 2)).reduce((a, b) => a + b) / y.length);

  return covXY / (stdDevX * stdDevY);
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

int selectedDataSetIndex = -1;
List<double> radarChartValues1 = [6, 7, 8, 9];
List<double> radarChartValues2 = [10, 11, 12, 13];
List<double> radarChartValues3 = [14, 15, 16, 17];
List<double> radarChartValues4 = [18, 19, 20, 21];
List<double> radarChartValues5 = [22, 23, 24, 24];
String badHabit = "";
String goodHabit = "";
String script = "";
final userUid = FirebaseAuth.instance.currentUser!.uid;

class MainPageState extends State<MainPage> {
  double stress = 0;
  List<double> radarChartValues = [0, 0, 0, 0];
  double MBscore = 0;
  double badData = 0;
  double goodData = 0;
  final firestoreInstance = FirebaseFirestore.instance;
  String MBstate = "";

  List<double> badHabitdata = [];
  List<double> goodHabitdata = [];
//  Map<String, double> coefficients = calculateB(badHabit);
//  Map<String, double> coefficients = calculateB(goodHabit);

  Stream<String> getUserNameStream() {
    return firestoreInstance
        .collection('users')
        .doc(userUid)
        .snapshots()
        .map((snapshot) => snapshot.data()?['name'] ?? '');
  }

  double MB(List<double> radarChartValues) {
    double step1 = (radarChartValues[0] - radarChartValues[1]).abs() +
        (radarChartValues[0] - radarChartValues[2]).abs() +
        (radarChartValues[0] - radarChartValues[3]).abs() +
        (radarChartValues[1] - radarChartValues[2]).abs() +
        (radarChartValues[1] - radarChartValues[3]).abs() +
        (radarChartValues[2] - radarChartValues[3]).abs();

    double step2 = step1 / 80 * 100;
    double step3 = 100 - step2;
    return step3;
  }

  String MBs(List<double> radarChartValues) {
    // 조합과 그 조합의 곱을 저장할 Map 선언
    Map<String, double> combinations = {
      'A*P': radarChartValues[0] * radarChartValues[1],
      'A*C': radarChartValues[0] * radarChartValues[3],
      'P*B': radarChartValues[1] * radarChartValues[2],
      'B*C': radarChartValues[2] * radarChartValues[3],
    };
    String result = '''귀하의 기본동기 수준은 다음과 같습니다. (24점 만점에)\n
자율감: ${radarChartValues[0].toStringAsFixed(3)}점,
목표감: ${radarChartValues[1].toStringAsFixed(3)}점,
소속감: ${radarChartValues[2].toStringAsFixed(3)}점,
유능감: ${radarChartValues[3].toStringAsFixed(3)}점.\n
''';
    // Map에서 가장 작은 값을 가진 키 찾기
    String minCombination = combinations.entries
        .reduce((minEntry, entry) =>
            entry.value < minEntry.value ? entry : minEntry)
        .key;
    if (minCombination == "A*P") {
      result = '''$result현재, 다른 요인보다 자율감과 목표감이 낮은 상태입니다.\n
자율감과 목표감을 역기능적으로 추구하게 되면 충동을 느낄 수 있습니다.\n
스스로 하고자 하는 바를 선택하며 자율감을 증진시키고, 하고자 하는 바나 이루고자 하는 바를 구체화하여 목표감을 확보한다면 보다 건강한 동기균형을 갖추실 수 있습니다.\n 
스스로 계획을 세울 수 있고 선택할 수 있는 여행을 떠나보시는건 어떨까요?''';
    } else if (minCombination == "A*C") {
      result = '''$result현재, 다른 요인보다 자율감과 유능감이 낮은 상태입니다.\n
자율감과 유능감을 역기능적으로 추구하게 되면 강박 증상이 나타날 수 있습니다.\n
스스로 하고 싶은 활동을 선택하여 자율감을 증진시키고, 스스로 생각했을 때 진전이나 성취가 느껴질 수 있는 활동을 통해 유능감을 확보한다면 보다 건강한 동기균형을 갖추실 수 있습니다.\n
스스로 선택할 수 있고 실력과 소정의 성과를 돌아볼 수 있는 취미활동을 즐겨보시는건 어떨까요?''';
    } else if (minCombination == "P*B") {
      result = '''$result현재, 다른 요인보다 소속감과 목표감이 낮은 상태입니다.\n
소속감과 목표감을 역기능적으로 추구하게 되면 불안 증상이 나타날 수 있습니다.\n
타인들과 협업하거나 소통하며 소속감을 증진시키고, 이루고자 하는 구체적인 목표를 설정한다면 소속감과 목표감을 확보하여 보다 건강한 동기균형을 갖추실 수 있습니다.\n
다수와 함께 활동할 수 있고 같은 목표를 바라보게 되는 봉사 활동이나 종교 활동을 해보는건 어떨까요?''';
    } else if (minCombination == "B*C") {
      result = '''$result현재, 다른 요인보다 소속감과 유능감이 낮은 상태입니다.\n
소속감과 유능감을 역기능적으로 추구하게 되면 우울 증상이 나타날 수 있습니다.\n
타인과 협업하거나 소통하는 과정을 통해 소속감을 증진시키고, 어떤 일을 성취하며 진전을 느껴가며 유능감을 확보한다면 보다 건강한 동기균형을 갖추실 수 있습니다.\n
타인과 함께 협업할 수 있고, 주어진 과제를 해결할 수 있는 직업 활동이나 단체 활동을 해보시는건 어떨까요?''';
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    // Add a listener to the user's survey responses for real-time updates
    FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('1')
        .snapshots()
        .listen((QuerySnapshot snapshots) {
      if (mounted) {
        // Check if the widget is still mounted to avoid calling setState on a disposed widget
        updateRadarChart();
      }
    });
  }

  void updateRadarChart() async {
    // Fetch the latest survey responses and update the radarChartValues
    final List<double> values = [
      await autonomy(userUid),
      await pursuing(userUid),
      await belonging(userUid),
      await competence(userUid),
    ];
    final stressValue = await cstress(userUid);
    final snapshot =
        await firestoreInstance.collection('users').doc(userUid).get();
    final data = snapshot.data() as Map<String, dynamic>;
    badHabit = data['badHabit'];
    goodHabit = data['goodHabit'];
    final badDataValue = await fHabit(userUid, badHabit);
    final goodDataValue = await fHabit(userUid, goodHabit);
    await listSet(badHabitdata, badHabit);
    await listSet(goodHabitdata, goodHabit);

    setState(() {
      stress = stressValue;
      radarChartValues = values;
      MBscore = MB(radarChartValues);
      MBstate = MBs(radarChartValues);
      badData = badDataValue;
      goodData = goodDataValue;
      explain();
    });
  }

  Future<double> fHabit(String userUid, String habit) async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection(habit)
        .get();

    int sum = 0;
    int count = snapshots.docs.length;

    switch (habit) {
      case '3': // 스마트폰 과의존, 총 15문항 역문항 4 10 15, 리커트 5점 1~5

        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 15; i++) {
            if (i == 4 || i == 10 || i == 15) {
              sum += (6 - (data['$i'] ?? 0) as int);
            } else {
              sum += (data['$i'] ?? 0) as int;
            }
          }
        }
        return count > 0 ? sum / (count) : 0;

      case '4': // SNS 중독 경향성, 총 24문항 역문항 9, 리커트 4점 1~4

        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 24; i++) {
            if (i == 9) {
              sum += (5 - (data['$i'] ?? 0) as int);
            } else {
              sum += (data['$i'] ?? 0) as int;
            }
          }
          return count > 0 ? sum / (count) : 0;
        }

      case '5': // 게임 중독 척도, 총 20 문항 역문항 없음, 리커트 5점 1~5

        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 20; i++) {
            sum += (data['$i'] ?? 0) as int;
          }
          return count > 0 ? sum / (count) : 0;
        }

      case '6': // 유튜브 과의존 척도, 총 22문항 역문항 없음, 리커트 5점 1~5
        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 22; i++) {
            sum += (data['$i'] ?? 0) as int;
          }
          return count > 0 ? sum / (count) : 0;
        }
      case '7': // 온라인 쇼핑 중독, 총 15문항 역문항 없음, 리커트 5점 1~5
        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 15; i++) {
            sum += (data['$i'] ?? 0) as int;
          }
          return count > 0 ? sum / (count) : 0;
        }
      case '8': // 학습 습관, 총 16문항 역문항 11, 리커트 5점 1~5
        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 16; i++) {
            if (i == 11) {
              sum += (6 - (data['$i'] ?? 0) as int);
            } else {
              sum += (data['$i'] ?? 0) as int;
            }
          }
          return count > 0 ? sum / (count) : 0;
        }
      case '9': // 운동 습관 척도, 총 12문항 역문항 없음, 리커트 5,7점 1~5, 1~7
        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 12; i++) {
            sum += (data['$i'] ?? 0) as int;
          }
          return count > 0 ? sum / (count) : 0;
        }
      case '10': // 수면 습관 척도, 총 10문항 역문항 없음, 리커트 5점 1~5
        for (var doc in snapshots.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          for (int i = 1; i <= 10; i++) {
            sum += (data['$i'] ?? 0) as int;
          }
          return count > 0 ? sum / (count) : 0;
        }
      default:
        return 0;
    }
    return 0;
  }

  Future<double> autonomy(String userUid) async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('1')
        .get();

    int sum = 0;
    int count = snapshots.docs.length;

    for (var doc in snapshots.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      for (int i = 1; i <= 4; i++) {
        sum += (data['$i'] ?? 0) as int;
      }
    }
    return count > 0 ? sum / (count) : 0;
  }

  Future<double> competence(String userUid) async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('1')
        .get();

    int sum = 0;
    int count = snapshots.docs.length;

    for (var doc in snapshots.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      for (int i = 5; i <= 8; i++) {
        sum += (data['$i'] ?? 0) as int;
      }
    }
    return count > 0 ? sum / (count) : 0;
  }

  Future<double> belonging(String userUid) async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('1')
        .get();

    int sum = 0;
    int count = snapshots.docs.length;

    for (var doc in snapshots.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      for (int i = 9; i <= 12; i++) {
        sum += (data['$i'] ?? 0) as int;
      }
    }
    return count > 0 ? sum / (count) : 0;
  }

  Future<double> pursuing(String userUid) async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('1')
        .get();

    int sum = 0;
    int count = snapshots.docs.length;

    for (var doc in snapshots.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      for (int i = 13; i <= 16; i++) {
        sum += (data['$i'] ?? 0) as int;
      }
    }
    return count > 0 ? sum / (count) : 0;
  }

  Future<double> cstress(String userUid) async {
    QuerySnapshot snapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('2')
        .get();

    int sum = 0;
    int count = snapshots.docs.length;

    for (var doc in snapshots.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      for (int i = 1; i <= 10; i++) {
        if (i == 1 || i == 2 || i == 3 || i == 9 || i == 10) {
          sum += (data['$i'] ?? 0) as int;
        } else {
          sum += (4 - (data['$i'] ?? 0) as int);
        }
      }
    }
    return count > 0 ? sum / (count) : 0;
  }

  Widget returnPage(String scaleNum) {
    switch (scaleNum) {
      case '1':
        return Scale01Page();
      case '2':
        return Scale02Page();
      case '3':
        return Scale03Page();
      case '4':
        return Scale04Page();
      case '5':
        return Scale05Page();
      case '6':
        return Scale06Page();
      case '7':
        return Scale07Page();
      case '8':
        return Scale08Page();
      case '9':
        return Scale09Page();
      case '10':
        return Scale10Page();
      default:
        return const MainPage();
    }
  }

  double angleValue = 0;
  bool relativeAngleMode = true;

  int box = 25;
  late double autonomy_data, pursuing_data, belonging_data, competence_data;

  /// 메인 UI 파트
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(context),
      /*
      PreferredSize(
        preferredSize:
            ui.Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /**
             * 인사글 섹션
             */
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: StreamBuilder<String>(
                stream: getUserNameStream(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // 로딩 중일 때 보여줄 위젯
                  } else {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      String? truncatedName = snapshot.data!.length > 4
                          ? '${snapshot.data?.substring(0, 3)}...'
                          : snapshot.data;
                      return Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "안녕하세요",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    truncatedName as String, // 사용자의 이름
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff7D5A50)),
                                  ),
                                  const Text(
                                    "  님",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ),
            const Spacer(),
            /**
             * 습관 재설정 섹션
             */
            SizedBox(
              width: 130,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0.4, backgroundColor: const Color(0xffFEF6EF)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HabitPage()));
                },
                child: const Text("습관 재설정",
                    style: TextStyle(fontSize: 14, color: Color(0xff381E72))),
              ),
            ),
            /**
             * 설정 섹션
             */
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingPage()));
                  },
                  icon: const Icon(Icons.settings)),
            ),
          ],
        ),
      ),*/

      /**
       * BODY 부분
       */
      body: FutureBuilder<List<double>>(
        future: Future.wait([
          autonomy(userUid),
          pursuing(userUid),
          belonging(userUid),
          competence(userUid),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            radarChartValues = snapshot.data ?? [0, 0, 0, 0];
            List<RawDataSet> updatedDataSets = [
              RawDataSet(
                title: '동기균형',
                color: Colors.blue,
                values: radarChartValues,
              ),
            ];
            return buildMainPage(updatedDataSets);
          }
        },
      ),
    );
  }

  Widget buildMainPage(List<RawDataSet> updatedDataSets) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        /**
         * 습관조절 섹션
         */
        Positioned(
          top: MediaQuery.of(context).size.height / 100 * 31,
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                //color: const Color(0xffFEF6EF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  )
                ]),
            width: MediaQuery.of(context).size.width / 100 * 90,
            height: MediaQuery.of(context).size.height / 100 * 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    child: _LineChart(
                      goodHabitData: goodHabitdata,
                      badHabitData: badHabitdata,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        /**
         * 설문 응답하기 버튼 섹션
         */
        Positioned(
          bottom: -MediaQuery.of(context).size.height * 0.02,
          child: Container(
            height: MediaQuery.of(context).size.height / 100 * 15,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 35),
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {
                final snapshot = await firestoreInstance
                    .collection('users')
                    .doc(userUid)
                    .get();
                final data = snapshot.data() as Map<String, dynamic>;
                badHabit = data['badHabit'];
                goodHabit = data['goodHabit'];
                // ignore: use_build_context_synchronously
                String step = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Scale01Page()));
                if (step == 'end') {
                  if (!context.mounted) return;
                  step = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Scale02Page()));
                } else {
                  updateRadarChart();
                }
                if (step == 'end') {
                  if (!context.mounted) return;
                  step = await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => returnPage(badHabit)));
                } else {
                  updateRadarChart();
                }
                if (step == 'end') {
                  if (!context.mounted) return;
                  step = await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => returnPage(goodHabit)));
                } else {
                  updateRadarChart();
                }
                updateRadarChart();
              },
              child: const Text(
                "설문 응답하기",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        /**
         * 동기균형 / 스트레스 섹션
         */
        Positioned(
          top: MediaQuery.of(context).size.height / 100 * 3,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userUid)
                .collection('1')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              autonomy_data =
                  competence_data = belonging_data = pursuing_data = 0;
              if (snapshot.hasData) {
                final docs = snapshot.data?.docs;
                if (docs != null) {
                  for (final doc in docs) {
                    Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    for (int i = 1; i <= 4; i++) {
                      autonomy_data += (data['$i'] ?? 0) as int;
                    }

                    for (int i = 5; i <= 8; i++) {
                      competence_data += (data['$i'] ?? 0) as int;
                    }

                    for (int i = 9; i <= 12; i++) {
                      belonging_data += (data['$i'] ?? 0) as int;
                    }

                    for (int i = 13; i <= 16; i++) {
                      pursuing_data += (data['$i'] ?? 0) as int;
                    }
                  }
                }
                int length = docs!.length;
                autonomy_data = autonomy_data / length;
                competence_data = competence_data / length;
                belonging_data = belonging_data / length;
                pursuing_data = pursuing_data / length;
                // ignore: avoid_print
                print(
                    "!!! -> ($autonomy_data, $competence_data), ($belonging_data, $pursuing_data)");
                radarChartValues = [
                  autonomy_data,
                  pursuing_data,
                  belonging_data,
                  competence_data
                ];
                MBscore = MB(radarChartValues);
                MBstate = MBs(radarChartValues);
              }
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    if (box == 25) {
                      box = 55;
                    } else {
                      box = 25;
                    }
                  });
                },
                child: AnimatedContainer(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: MediaQuery.of(context).size.width / 100 * 90,
                  height: MediaQuery.of(context).size.height / 100 * box,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //color: const Color(0xffFEF6EF),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 동기균형 차트
                          Container(
                            width: MediaQuery.of(context).size.width / 100 * 45,
                            height:
                                MediaQuery.of(context).size.height / 100 * 25,
                            padding: const EdgeInsets.all(40),
                            child: RadarChart(
                              RadarChartData(
                                dataSets: showingDataSets(radarChartValues),
                                radarShape: RadarShape.polygon,
                                radarBackgroundColor: Colors.transparent,
                                borderData: FlBorderData(show: false),
                                radarBorderData:
                                    const BorderSide(color: Colors.transparent),
                                titlePositionPercentageOffset: 0.3,
                                titleTextStyle: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                getTitle: (index, angle) {
                                  final usedAngle = relativeAngleMode
                                      ? angle + angleValue
                                      : angleValue;
                                  switch (index) {
                                    case 0:
                                      return RadarChartTitle(
                                        text: '자율감',
                                        angle: usedAngle,
                                      );
                                    case 1:
                                      return RadarChartTitle(
                                        text: '목표감',
                                        angle: usedAngle - 90,
                                      );
                                    case 2:
                                      return RadarChartTitle(
                                        text: '소속감',
                                        angle: usedAngle + 180,
                                      );
                                    case 3:
                                      return RadarChartTitle(
                                        text: '유능감',
                                        angle: usedAngle + 90,
                                      );
                                    default:
                                      return const RadarChartTitle(text: '');
                                  }
                                },

                                tickCount: 6,
                                ticksTextStyle: const TextStyle(
                                    color: Colors.transparent, fontSize: 10),
                                tickBorderData:
                                    const BorderSide(color: Colors.transparent),
                                gridBorderData: const BorderSide(
                                    color: Colors.black, width: 2),
                                // read about it in the RadarChartData section
                              ),
                              swapAnimationDuration:
                                  const Duration(milliseconds: 150), // Optional
                              swapAnimationCurve: Curves.linear, // Optional
                            ),
                          ),
                          // 스트레스 게이지
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userUid)
                                  .collection('2')
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                stress = 0;
                                if (snapshot.hasData) {
                                  final docs = snapshot.data?.docs;
                                  if (docs != null) {
                                    for (final doc in docs) {
                                      Map<String, dynamic> data =
                                          doc.data() as Map<String, dynamic>;
                                      for (int i = 1; i <= 10; i++) {
                                        if (i == 1 ||
                                            i == 2 ||
                                            i == 3 ||
                                            i == 9 ||
                                            i == 10) {
                                          stress += (data['$i'] ?? 0) as int;
                                        } else {
                                          stress +=
                                              (4 - (data['$i'] ?? 0) as int);
                                        }
                                      }
                                    }
                                  }
                                  int length = docs!.length;
                                  // ignore: avoid_print
                                  print(
                                      "stress : $stress / $length = ${(stress / length).toStringAsFixed(0)}");
                                  stress = double.parse(
                                      (stress / length).toStringAsFixed(0));
                                }
                                return Container(
                                  width: MediaQuery.of(context).size.width /
                                      100 *
                                      43,
                                  height: MediaQuery.of(context).size.height /
                                      100 *
                                      25,
                                  padding: const EdgeInsets.all(25),
                                  child: SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        minimum: 0,
                                        maximum: 40,
                                        interval: 10,
                                        canRotateLabels: false,
                                        showFirstLabel: false,
                                        showLastLabel: false,
                                        axisLineStyle: const AxisLineStyle(
                                          //dashArray: <double>[5,5],
                                          thickness: 0.1,
                                          thicknessUnit: GaugeSizeUnit.factor,
                                          gradient: SweepGradient(
                                            colors: <Color>[
                                              Color(0xFF000000),
                                              Color(0xFFffffff),
                                            ],
                                            stops: <double>[1, 5],
                                          ),
                                        ),
                                        tickOffset: -0.02,
                                        labelOffset: 0.2,
                                        offsetUnit: GaugeSizeUnit.factor,
                                        majorTickStyle: const MajorTickStyle(
                                          length: 0.06,
                                          lengthUnit: GaugeSizeUnit.factor,
                                          thickness: 1.5,
                                        ),
                                        minorTickStyle: const MinorTickStyle(
                                          length: 0.03,
                                          lengthUnit: GaugeSizeUnit.factor,
                                          thickness: 1.5,
                                        ),
                                        pointers: <GaugePointer>[
                                          MarkerPointer(
                                            value: stress,
                                            markerHeight: 15,
                                            markerWidth: 15,
                                            markerType: MarkerType.circle,
                                            color: Colors.yellow,
                                            borderWidth: 4,
                                            borderColor: Colors.blue,
                                            //enableAnimation: true,
                                            //animationType: AnimationType.linear,
                                          ),
                                        ],
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                            widget: Text(
                                              '스트레스\n지수: $stress',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            angle: 90,
                                            positionFactor: 0.9,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 15),
                                child:
                                    Text("귀하의 동기균형 점수는 100점 만점에 ${MBscore.toStringAsFixed(3)} 입니다."),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 10),
                                child: Text(MBstate),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Radar chart 에서 필요한 구조체 선언
List<RadarDataSet> showingDataSets(List<double> radarChartValues) {
  return rawDataSets(radarChartValues).asMap().entries.map((entry) {
    final index = entry.key;
    final rawDataSet = entry.value;

    final isSelected = index == selectedDataSetIndex
        ? true
        : selectedDataSetIndex == -1
            ? true
            : false;

    return RadarDataSet(
      fillColor: isSelected
          ? rawDataSet.color.withOpacity(0)
          : rawDataSet.color.withOpacity(0),
      borderColor:
          isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
      entryRadius: isSelected ? 3 : 2,
      dataEntries: rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
      borderWidth: isSelected ? 2.3 : 2,
    );
  }).toList();
}

List<RawDataSet> rawDataSets(List<double> radarChartValues) {
  return [
    RawDataSet(
      title: '동기균형',
      color: Colors.redAccent,
      values: radarChartValues,
    ),
    RawDataSet(
      title: 'Scale1',
      color: Colors.transparent,
      values: radarChartValues1,
    ),
    RawDataSet(
      title: 'Scale2',
      color: Colors.transparent,
      values: radarChartValues2,
    ),
    RawDataSet(
      title: 'Scale3',
      color: Colors.transparent,
      values: radarChartValues3,
    ),
    RawDataSet(
      title: 'Scale4',
      color: Colors.transparent,
      values: radarChartValues4,
    ),
    RawDataSet(
      title: 'Scale5',
      color: Colors.transparent,
      values: radarChartValues5,
    ),
  ];
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}

/* 변화 추이 클래스 */
List<FlSpot> FlbadHabit = [];
List<FlSpot> FlgoodHabit = [];

class _LineChart extends StatefulWidget {
  const _LineChart(
      {Key? key, required this.goodHabitData, required this.badHabitData})
      : super(key: key);

  final List<double> goodHabitData;
  final List<double> badHabitData;

  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<_LineChart> {
  late bool isFliped;

  @override
  void initState() {
    super.initState();
    loadChartData();
    isFliped = false;
  }

  Future<List<FlSpot>> loadChartData() async {
    FlbadHabit = await chartList(widget.badHabitData, badHabit);
    FlgoodHabit = await chartList(widget.goodHabitData, goodHabit);

    return [...FlbadHabit, ...FlgoodHabit];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          explain();
          isFliped = !isFliped;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1500),
        child: !isFliped
            ? FutureBuilder<List<FlSpot>>(
                future: loadChartData(),
                builder: (context, snapshot) {
                  print(FlbadHabit);
                  print(FlgoodHabit);
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return LineChart(
                      DataSum,
                      duration: const Duration(milliseconds: 0),
                    );
                  }
                },
              )
            : HabitText(),
      ),
    );
  }

  LineChartData get DataSum => LineChartData(
        lineTouchData: lineTouchDataSum,
        gridData: gridData,
        titlesData: titlesDataSum,
        borderData: borderData,
        lineBarsData: lineBarsDataSum,
        minX: 1,
        maxX: 7,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchDataSum => LineTouchData(
        handleBuiltInTouches: false, // 데이터 눌렀을 때 값 보여줄건지?
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesDataSum => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsDataSum => [
        lineChartBarDataSum_1,
        lineChartBarDataSum_2,
      ];

  // 여기에 값이 인가되면 됨.
  LineChartBarData get lineChartBarDataSum_1 => LineChartBarData(
        isCurved: false,
        curveSmoothness: 0,
        color: Colors.cyan
            .withOpacity(0.5), // AppColors.contentColorGreen.withOpacity(0.5),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true), // 데이터 별로 dot 찍을건지?
        belowBarData: BarAreaData(
            show: true,
            color: Colors.cyanAccent.withOpacity(0.3)), // 데이터 밑에 색 칠할건지?
        spots: FlgoodHabit,
      );

  LineChartBarData get lineChartBarDataSum_2 => LineChartBarData(
        isCurved: false,
        color: Colors.redAccent
            .withOpacity(0.5), // AppColors.contentColorPink.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.redAccent
              .withOpacity(0.2), // AppColors.contentColorPink.withOpacity(0.2),
        ),
        spots: FlbadHabit,
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    String text;
    switch (value.toInt()) {
      case 10:
        text = '10';
        break;
      case 20:
        text = '20';
        break;
      case 30:
        text = '30';
        break;
      case 40:
        text = '40';
        break;
      case 50:
        text = '50';
        break;
      case 60:
        text = '60';
        break;
      case 70:
        text = '70';
        break;
      case 80:
        text = '80';
        break;
      case 90:
        text = '90';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 20,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 3:
        text = const Text('3', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 5:
        text = const Text('5', style: style);
        break;
      case 6:
        text = const Text('6', style: style);
        break;
      case 7:
        text = const Text('7', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  Widget HabitText() {
    final ScrollController Controller = ScrollController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Scrollbar(
            thumbVisibility: true,
            controller: Controller,
            scrollbarOrientation: ScrollbarOrientation.right,
            radius: const Radius.circular(20),
            child: SingleChildScrollView(
              controller: Controller,
              child: Text(script),
            ),
          ),
        ),
      ],
    );
  }
}
// class

Future<List<FlSpot>> chartList(List<double> list, String code) async {
  final userUid = FirebaseAuth.instance.currentUser!.uid;
  QuerySnapshot snapshots = await FirebaseFirestore.instance
      .collection('users')
      .doc(userUid)
      .collection(code)
      .get();

  List<FlSpot> Fllist = [];
  int count = snapshots.docs.length;

  if (count <= 7) {
    double i = 1;
    int j = 0;
    for (; j < count; i++, j++) {
      Fllist.add(FlSpot(i, list[j]));
    }
  } else {
    double i = 1;
    int j = count - 6;
    for (; j < count; i++, j++) {
      Fllist.add(FlSpot(i, list[j]));
    }
  }

  return Fllist;
}

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final MainPageState mainPageState = MainPageState();

  AppBar(this.context, {super.key});

  @override
  ui.Size get preferredSize =>
      ui.Size.fromHeight(MediaQuery.of(context).size.height * 0.2);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:
          ui.Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /**
           * 인사글 섹션
           */
          Container(
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 20),
            child: StreamBuilder<String>(
              stream: mainPageState.getUserNameStream(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                /*if (snapshot.connectionState == ConnectionState.waiting) {

                  print("snapshot is waiting");
                  return Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "안녕하세요",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ("마마마마").padRight(4, ' '), // 사용자의 이름
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.transparent),
                              ),
                              const Text(
                                "  님",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );

                } else */
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print("snapshot has error");
                  return const Text('정보를 받아오는 중입니다.');
                } else {
                  String? truncatedName = snapshot.data!.length > 4
                      ? '${snapshot.data?.substring(0, 3)}...'
                      : snapshot.data;
                  return Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "안녕하세요",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (truncatedName as String)
                                    .padRight(4, ' '), // 사용자의 이름
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff7D5A50)),
                              ),
                              const Text(
                                "  님",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          const Spacer(),
          /**
           * 습관 재설정 섹션
           */
          SizedBox(
            width: 130,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0.4, backgroundColor: const Color(0xffFEF6EF)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HabitPage()));
              },
              child: const Text("습관 재설정",
                  style: TextStyle(fontSize: 14, color: Color(0xff381E72))),
            ),
          ),
          /**
           * 설정 섹션
           */
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingPage()));
                },
                icon: const Icon(Icons.settings)),
          ),
        ],
      ),
    );
  }
}
