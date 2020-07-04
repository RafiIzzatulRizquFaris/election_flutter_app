import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreen();
  }

}

class HomeScreen extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  }

}