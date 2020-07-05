import 'package:election_flutter_app/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }

}

class LoginScreen extends State<Login>{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    verticalTitle(),
                    textLogin(),
                  ],
                ),
                inputEmail(),
                inputPassword(),
                buttonLogin(),
                firstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  mainForm() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [ListView(children: [],),],),
      ),
    );
  }

  verticalTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 60, left: 10),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }

  textLogin() {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 10),
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Container(
              height: 60,
            ),
            Center(
              child: Text(
                "Student Council \nSTARBHAK Election",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  inputEmail() {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: emailController,
          autofocus: true,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: "Email",
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  inputPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: passwordController,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  buttonLogin() {
    return Padding(
      padding: EdgeInsets.only(top: 50, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.blue[300],
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(5, 5)
            ),
          ],
        ),
        child: FlatButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Home();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  firstTime() {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 30,),
      child: Container(
        alignment: Alignment.topRight,
        height: 20,
        child: Row(
          children: [
            Text(
              "Not have account yet?",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            FlatButton(
              onPressed: (){},
              child: Text(
                "Register now.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

}