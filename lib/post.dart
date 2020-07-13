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
      body: Center(
        child: Text(
          "Post Screen",
        ),
      ),
    );
  }
}
