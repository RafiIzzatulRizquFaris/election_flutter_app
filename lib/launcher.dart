import 'dart:async';

import 'package:election_flutter_app/login.dart';
import 'package:flutter/material.dart';

class Launcher extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LauncherScreen();
  }

}

class LauncherScreen extends State<Launcher>{

  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Launcher"),
      ),
    );
  }

  startLaunching() {
    var duration = Duration(seconds: 2);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
        return Login();
      }));
    });
  }

}