import 'package:election_flutter_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer.dart';

class Countdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountdownScreen();
  }
}

class CountdownScreen extends State<Countdown> {
  int estimateTs = DateTime(2020, 9, 21, 9, 10, 00).millisecondsSinceEpoch;
  bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: isDone
            ? endCountdownWidget()
            : CountdownTimer(
                emptyWidget: endCountdownWidget(),
                endTime: estimateTs,
                onEnd: () {
                  setState(() {
                    isDone = true;
                  });
                },
                daysTextStyle: TextStyle(fontSize: 20, color: Colors.white54),
                hoursTextStyle: TextStyle(fontSize: 30, color: Colors.white60),
                minTextStyle: TextStyle(fontSize: 40, color: Colors.white70),
                secTextStyle: TextStyle(fontSize: 50, color: Colors.white),
                daysSymbolTextStyle:
                    TextStyle(fontSize: 25, color: Colors.white54),
                hoursSymbolTextStyle:
                    TextStyle(fontSize: 35, color: Colors.white60),
                minSymbolTextStyle:
                    TextStyle(fontSize: 45, color: Colors.white70),
                secSymbolTextStyle:
                    TextStyle(fontSize: 55, color: Colors.white),
              ),
      ),
    );
  }

  endCountdownWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Countdown Finished",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
          child: Text(
            "Pilih Sekarang !",
          ),
          color: Colors.blueAccent,
          textColor: Colors.white,
          padding: EdgeInsets.all(10),
        ),
      ],
    );
  }
}
