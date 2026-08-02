import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.cyan,
        title: Text(
          "List Post",
          style: TextStyle(color:Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}