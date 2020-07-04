import 'package:flutter/material.dart';

class Launcher extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LauncherScreen();
  }

}

class LauncherScreen extends State<Launcher>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Launcher"),
    );
  }

}