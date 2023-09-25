import 'package:flutter/material.dart';
import './settingPage.dart';
import './repondPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RepondPage()));
              },
              child: Text("습관 재설정")),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("동기 균형"),
                ),
              ),
              Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("스트레스"),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("고치고 싶은 습관"),
                ),
              ),
              Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text("개발하고 싶은 습관"),
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RepondPage()));
            },
            child: Text("설문 응답하기"),
          )
        ],
      ),
    );
  }
}
