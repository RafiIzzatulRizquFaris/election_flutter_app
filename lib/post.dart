import 'package:election_flutter_app/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostScreen();
  }
}

class PostScreen extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().blueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/check_success.png",
              alignment: Alignment.center,
              width: 150,
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              "Thank you for voting and not abstaining\nYour Vote Matters",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
