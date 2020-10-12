import 'package:election_flutter_app/launcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var nik = preferences.get("nik");
  var pw = preferences.get("password");
  runApp(MyApp(
    nik: nik,
    password: pw,
  ));
}

class MyApp extends StatelessWidget {
  final String nik, password;

  const MyApp({this.nik, this.password});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Election Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Launcher(nik: nik, password: password,),
      // token == null
      //     ? Launcher()
      //     : Container(
      //         child: FutureBuilder(
      //           future: isAlreadyChosen(),
      //           builder: (context, snapshot) {
      //             print(snapshot.data);
      //             if(snapshot.data == false){
      //               return Countdown();
      //             }else if(snapshot.data == true){
      //               return Post();
      //             }else{
      //               return Countdown();
      //             }
      //           },
      //         ),
      //       ),
    );
  }

  // Future<bool> isAlreadyChosen() async {
  //   Firestore firestore = Firestore.instance;
  //   QuerySnapshot querySnapshot = await firestore
  //       .collection("user")
  //       .where("iduser", isEqualTo: token)
  //       .getDocuments();
  //   return querySnapshot.documents[0].data["chosen"];
  // }
}
