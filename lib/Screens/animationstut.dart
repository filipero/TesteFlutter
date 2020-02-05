import 'package:flutter/material.dart';
import 'package:apitest/loaderanim.dart';

class Anim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueAccent,
      body: new Center(
        child: Loader(),
      ),
    );
  }
}
