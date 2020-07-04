import 'package:election_flutter_app/home.dart';
import 'package:election_flutter_app/launcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.get("uid");
  runApp(MyApp(token: token,));
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
      home: token == null ? Launcher() : Home(),
    );
  }
}