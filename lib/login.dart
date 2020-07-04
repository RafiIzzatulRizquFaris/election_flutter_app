import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }

}

class LoginScreen extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Login"),
    );
  }

}