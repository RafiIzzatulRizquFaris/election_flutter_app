import 'package:election_flutter_app/constants.dart';
import 'package:election_flutter_app/countdown.dart';
import 'package:election_flutter_app/contract/login_contract.dart';
import 'package:election_flutter_app/model/Login.dart' as LoginModel;
import 'package:election_flutter_app/presenter/login_presenter.dart';
import 'package:election_flutter_app/post.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreen();
  }
}

class LoginScreen extends State<Login> implements LoginContractView {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginPresenter loginPresenter;
  var isLoading;
  var isError;

  LoginScreen() {
    loginPresenter = LoginPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
    isError = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColor().blueColor,
              Color(0xff524CFF),
            ],
          ),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : ListView(
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

  verticalTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 60, left: 10),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontSize: 38, fontWeight: FontWeight.w900),
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
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: "Username",
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
        ),
        child: FlatButton(
          onPressed: () {
            if (emailController.text.trim().length > 0 &&
                passwordController.text.trim().length > 0) {
              setState(() {
                isLoading = true;
                isError = false;
              });
              loginPresenter.loadLoginData(
                  emailController.text.trim(), passwordController.text.trim());
            } else if (emailController.text.trim().length == 0) {
              errorAlert("Empty Email", "Please fill email field");
            } else if (passwordController.text.trim().length == 0) {
              errorAlert("Empty Password", "Please fill password field");
            } else if (emailController.text.trim().length == 0 &&
                passwordController.text.trim().length == 0) {
              errorAlert(
                  "Empty Field", "Make sure you fill all the field required");
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  color: AppColor().blueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColor().blueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  firstTime() {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 30,
      ),
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
              onPressed: () {},
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

  @override
  setLoginData(LoginModel.Login loginData) async {
    if (loginData == null) {
      setState(() {
        isError = true;
        isLoading = false;
      });
      errorAlert("Data not found", "Check your connection");
    } else {
      if (loginData.status == 'success') {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString("nik", loginData.data[0].nik_voter);
        await preferences.setString("password", loginData.data[0].password_voter);
        await preferences.setString("id", loginData.data[0].id_voter);
        setState(() {
          isLoading = false;
        });
        if (!isLoading && !isError && loginData.data[0].ischosen == '0') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Countdown();
          }));
        } else if (!isLoading && !isError && loginData.data[0].ischosen == '1') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Post();
          }));
        }
      } else if (loginData.status == 'failed') {
        if (loginData.message == 'You are already log in on other device') {
          setState(() {
            isError = true;
            isLoading = false;
          });
          errorAlert("Failed", "You are already log in on other device");
        } else if (loginData.message ==
            'Please contact the admin to ask for account') {
          setState(() {
            isError = true;
            isLoading = false;
          });
          errorAlert("Failed", "Please contact the admin to ask for account");
        } else if (loginData.message == 'Access denied') {
          setState(() {
            isError = true;
            isLoading = false;
          });
          errorAlert("Failed", "Access denied");
        }
      }
    }
    // if (value.isEmpty || value.length == 0) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   errorAlert(
    //       "Data not found", "Please contact the admin to ask for account");
    // } else {
    //   SharedPreferences preferences = await SharedPreferences.getInstance();
    //   await preferences.setString("uid", value[0]);
    //   setState(() {
    //     isLoading = false;
    //   });
    //   if (!isLoading && !isError && !value[1]) {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) {
    //       return Countdown();
    //     }));
    //   } else if (value[1]) {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) {
    //       return Post();
    //     }));
    //   }
    // }
  }

  @override
  onErrorLogin(error) {
    setState(() {
      isError = true;
      isLoading = false;
    });
    print(error);
    errorAlert("Data not found", "Check your connection");
  }

  errorAlert(String title, String subtitle) {
    return Alert(
      context: context,
      title: title,
      desc: subtitle,
      type: AlertType.warning,
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "OK",
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
          color: Colors.red,
        ),
        alertAlignment: Alignment.center,
      ),
    ).show();
  }
}
