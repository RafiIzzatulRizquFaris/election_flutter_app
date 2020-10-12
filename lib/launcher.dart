import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:election_flutter_app/app_color.dart';
import 'package:election_flutter_app/contract/check_contract.dart';
import 'package:election_flutter_app/countdown.dart';
import 'package:election_flutter_app/login.dart';
import 'package:election_flutter_app/model/Check.dart';
import 'package:election_flutter_app/post.dart';
import 'package:election_flutter_app/presenter/check_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Launcher extends StatefulWidget {
  const Launcher({this.nik, this.password});
  final String nik;
  final String password;
  @override
  State<StatefulWidget> createState() {
    return LauncherScreen();
  }
}

class LauncherScreen extends State<Launcher> implements CheckViewContract {
  CheckPresenter _checkPresenter;
  // String nik1, pw1;

  LauncherScreen() {
    _checkPresenter = CheckPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    // checkingAccount();
      if (widget.nik != null ||
          widget.password != null) {
        print(widget.password.toString());
        _checkPresenter.loadData(widget.nik.toString(), widget.password.toString());
      } else {
        print("listCheckaccount empty");
        startLaunching();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              AppColor().blueColor,
              Color(0xff524CFF),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/vote_illustration.png",
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotateAnimatedTextKit(
                  text: ["Select Your", "Future Leader"],
                  totalRepeatCount: 4,
                  pause: Duration(seconds: 1),
                  displayFullTextOnTap: true,
                  textStyle: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor().whiteColor,
                  ),
                  textAlign: TextAlign.center,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  startLaunching() {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Login();
      }));
    });
  }

  // checkingAccount() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var nik = preferences.get("nik");
  //   var pw = preferences.get("password");
  //   print(pw.toString());
  //   setState(() {
  //     nik1 = nik.toString();
  //     pw1 = pw.toString();
  //   });
  // }

  @override
  onErrorCheckData(error) {
    print(error);
    startLaunching();
  }

  @override
  onSuccessCheckData(Check check) {
    if (check != null) {
      if (check.status == 'success') {
        print(check.data[0].islogin);
        if (check.data[0].islogin == '1') {
          if (check.data[0].ischosen == '1') {
            var duration = Duration(seconds: 4);
            return Timer(duration, () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                return Post();
              }));
            });
          } else if (check.data[0].ischosen == '0') {
            var duration = Duration(seconds: 4);
            return Timer(duration, () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                return Countdown();
              }));
            });
          }
        } else if (check.data[0].islogin == '0') {
          print("Not login yet");
          startLaunching();
        }
      } else if (check.status == 'failed') {
        print("Status failed");
        startLaunching();
      }
    }else{
      print("check is null");
      startLaunching();
    }
  }
}
