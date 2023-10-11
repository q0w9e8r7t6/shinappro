import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';
import './settingPage.dart';
import './repondPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int selectedDataSetIndex = -1;

class _MainPageState extends State<MainPage> {
  double angleValue = 0;
  bool relativeAngleMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(125.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /**
             * 인사글 섹션
             */
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 20, 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "안녕하세요",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "닉네임",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff7D5A50)),
                      ),
                      Text(
                        "  님",
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
             * 습관 재설정 섹션
             */
            Container(
              width: 130,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0.4, backgroundColor: const Color(0xffFEF6EF)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RepondPage()));
                },
                child: const Text("습관 재설정", style: TextStyle(fontSize: 14)),
              ),
            ),
            /**
             * 습관 재설정 섹션
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 100 * 5,
            width: MediaQuery.of(context).size.width,
          ),
          /**
           * 동기균형 섹션
           */
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
            decoration: BoxDecoration(
                color: const Color(0xffFEF6EF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(2, 4),
                    blurRadius: 10,
                  )
                ]),
            width: MediaQuery.of(context).size.width / 100 * 90,
            height: MediaQuery.of(context).size.height / 100 * 25,
            child: Center(
                child: RadarChart(
              RadarChartData(
                dataSets: showingDataSets(),
                radarShape: RadarShape.polygon,
                radarBackgroundColor: Colors.transparent,
                borderData: FlBorderData(show: false),
                radarBorderData: const BorderSide(color: Colors.transparent),
                titlePositionPercentageOffset: 0.3,
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 14),
                getTitle: (index, angle) {
                  final usedAngle =
                      relativeAngleMode ? angle + angleValue : angleValue;
                  switch (index) {
                    case 0:
                      return RadarChartTitle(
                        text: '자율감',
                        angle: usedAngle,
                      );
                    case 1:
                      return RadarChartTitle(
                        text: '자율감',
                        angle: usedAngle - 90,
                      );
                    case 2:
                      return RadarChartTitle(
                        text: '자율감',
                        angle: usedAngle + 180,
                      );
                    case 3:
                      return RadarChartTitle(
                        text: '자율감',
                        angle: usedAngle + 90,
                      );
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                tickCount: 6,
                ticksTextStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                tickBorderData: const BorderSide(color: Colors.yellow),
                gridBorderData: BorderSide(color: Colors.black, width: 2.5),
                // read about it in the RadarChartData section
              ),
              swapAnimationDuration: Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            )),
          ),
          /**
           * 습관조절 섹션
           */
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
                color: const Color(0xffFEF6EF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(2, 4),
                    blurRadius: 10,
                  )
                ]),
            width: MediaQuery.of(context).size.width / 100 * 90,
            height: 100,
            child: Center(
              child: Text("동기 균형"),
            ),
          ),
          Spacer(),
          /**
           * 설문 응답하기 버튼 섹션
           */
          Container(
            height: MediaQuery.of(context).size.height / 100 * 15,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 35),
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RepondPage()));
              },
              child: const Text(
                "설문 응답하기",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/**
 * Radar chart 에서 필요한 구조체 선언
 */
List<RadarDataSet> showingDataSets() {
  return rawDataSets().asMap().entries.map((entry) {
    final index = entry.key;
    final rawDataSet = entry.value;

    final isSelected = index == selectedDataSetIndex
        ? true
        : selectedDataSetIndex == -1
            ? true
            : false;

    return RadarDataSet(
      fillColor: isSelected
          ? rawDataSet.color.withOpacity(0.2)
          : rawDataSet.color.withOpacity(0.05),
      borderColor:
          isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
      entryRadius: isSelected ? 3 : 2,
      dataEntries: rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
      borderWidth: isSelected ? 2.3 : 2,
    );
  }).toList();
}

List<RawDataSet> rawDataSets() {
  return [
    RawDataSet(
      title: '동기균형',
      color: Colors.blue,
      values: [
        300,
        50,
        250,
        500,
      ],
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

