import 'package:election_flutter_app/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
            Padding(
              padding: EdgeInsets.all(20),
              child: OutlineButton(
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
                  "Logout",
                  style: TextStyle(
                    color: AppColor().whiteColor,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Alert(
                    context: context,
                    title: "Logout",
                    desc: "Are you sure to logout?",
                    type: AlertType.info,
                    buttons: [
                      DialogButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.grey,
                      ),
                      DialogButton(
                        onPressed: () {},
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                    style: AlertStyle(
                      animationType: AnimationType.grow,
                      isCloseButton: false,
                      isOverlayTapDismiss: false,
                      descStyle: TextStyle(fontWeight: FontWeight.bold),
                      descTextAlign: TextAlign.start,
                      animationDuration: Duration(milliseconds: 400),
                      alertBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      titleStyle: TextStyle(
                        color: AppColor().blueColor,
                      ),
                      alertAlignment: Alignment.center,
                    ),
                  ).show();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
