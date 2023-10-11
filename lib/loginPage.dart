import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './mainPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // appBar: AppBar(title: Text("Login Page")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //height: MediaQuery.of(context).size.width/10,
              height: MediaQuery.of(context).size.height / 10 * 1.5,
            ),
            Container(
              height: 150,
              child: Image.asset("assets/image/hgu_logo.png"),
            ),
            Container(
                //height: MediaQuery.of(context).size.width/10,
                height: 50),
            Text("SHIN\nAPRO", style: GoogleFonts.pressStart2p(fontSize: 40, color: const Color(0xff7D5A50))),
            Container(
                //height: MediaQuery.of(context).size.width/10,
                height: 5),
            const Text("시나브로 변해가는 나의 습관"),
            Container(
              //height: MediaQuery.of(context).size.width/10,
              height: MediaQuery.of(context).size.height / 10 * 2,
            ),
            ElevatedButton(
              onPressed: () {
                /*
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                          (route) => false);
                       */ // 위의 네비게이팅 명령어를 사용하면 로그인 화면으로 다시 이동하지 않도록 할 수 있음.
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: const Text("Navigate to MainPage"),
            ),
            const Spacer(),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 25),
                child: const Text(
                  "Academic Society of Addiction and Rehabilitation Research",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
