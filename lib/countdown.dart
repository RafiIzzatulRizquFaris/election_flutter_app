import 'package:confetti/confetti.dart';
import 'package:election_flutter_app/constants.dart';
import 'package:election_flutter_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Countdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountdownScreen();
  }
}

class CountdownScreen extends State<Countdown> {
  int estimateTs = DateTime(2020, 10, 20, 20, 50, 00).millisecondsSinceEpoch;
  var isDone;
  ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    isDone = false;
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColor().blueColor,
            Color(0xff524CFF),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: isDone ? endCountdownWidget() : beginCountdownWidget(),
      ),
    );
  }

  beginCountdownWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Icon(
            Icons.how_to_vote,
            color: AppColor().whiteColor,
            size: 60,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            "Countdown to Election Day",
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        CountdownTimer(
          emptyWidget: emptyWidget(),
          endTime: estimateTs,
          onEnd: () {
            setState(() {
              isDone = true;
            });
          },
          widgetBuilder: (context, remainingTime){
            if (remainingTime == null){
              return emptyWidget();
            }
            List<Widget> timeList = [];
            if (remainingTime.days != null) {
              timeList.add(Text("${remainingTime.days.toString()}d", style: TextStyle(fontSize: 35, color: Colors.white54),));
            } if (remainingTime.hours != null) {
              timeList.add(Text("${remainingTime.hours.toString()}h", style: TextStyle(fontSize: 40, color: Colors.white60),));
            } if (remainingTime.min != null) {
              timeList.add(Text("${remainingTime.min.toString()}m", style: TextStyle(fontSize: 45, color: Colors.white70),));
            } if (remainingTime.sec != null) {
              timeList.add(Text("${remainingTime.sec.toString()}s", style: TextStyle(fontSize: 50, color: Colors.white),));
            }
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: timeList,);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Text(
            "Election day will be held on Thursday, 28th October 2020 at 8 am",
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  endCountdownWidget() {
    _controllerCenter.play();
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ], // manually specify the colors to be used
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Icon(
                Icons.how_to_vote,
                color: AppColor().whiteColor,
                size: 60,
              ),
            ),
            Text(
              "Countdown Finished",
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Text(
                "Today is the day to choose the leader of your choice",
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Vote Now!",
                      style: TextStyle(
                        color: AppColor().blueColor,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                color: AppColor().whiteColor,
                textColor: AppColor().blueColor,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  emptyWidget() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    // });
    return OutlineButton(
      borderSide: BorderSide(
        width: 2,
        color: AppColor().whiteColor,
      ),
      color: AppColor().blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(15),
      splashColor: AppColor().whiteColor,
      highlightColor: AppColor().whiteColor,
      child: Text(
        "Tap to Start",
        style: TextStyle(
          color: AppColor().whiteColor,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        setState(() {
          isDone = true;
        });
      },
    );
  }
}
