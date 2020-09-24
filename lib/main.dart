import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:election_flutter_app/countdown.dart';
import 'package:election_flutter_app/home.dart';
import 'package:election_flutter_app/launcher.dart';
import 'package:election_flutter_app/post.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.get("uid");
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final String token;

  const MyApp({this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Election Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      token == null
          ? Launcher()
          : Container(
              child: FutureBuilder(
                future: isAlreadyChosen(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if(snapshot.data == false){
                    return Countdown();
                  }else if(snapshot.data == true){
                    return Post();
                  }else{
                    return Countdown();
                  }
                },
              ),
            ),
    );
  }

  Future<bool> isAlreadyChosen() async {
    Firestore firestore = Firestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection("user")
        .where("iduser", isEqualTo: token)
        .getDocuments();
    return querySnapshot.documents[0].data["chosen"];
  }
}
