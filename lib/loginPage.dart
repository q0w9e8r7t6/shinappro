import 'package:flutter/material.dart';
import './mainPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login Page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SHINAPPRO"),
              Text("Login Page"),
              Container(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    /*
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                        (route) => false);
                     */ // 위의 네비게이팅 명령어를 사용하면 로그인 화면으로 다시 이동하지 않도록 할 수 있음.
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  child: Text("Navigate to MainPage"))
            ],
          ),
        ));
  }
}
