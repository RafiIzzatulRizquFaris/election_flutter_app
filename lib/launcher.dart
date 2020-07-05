import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:election_flutter_app/login.dart';
import 'package:flutter/material.dart';

class Launcher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LauncherScreen();
  }
}

class LauncherScreen extends State<Launcher> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/smk_taruna_bhakti.png",
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
                textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                textAlign: TextAlign.center,
                alignment: Alignment.center,
              ),
            ],
          ),
        ],
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
}
