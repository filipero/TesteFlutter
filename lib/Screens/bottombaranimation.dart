import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class BottomBarAnim extends StatefulWidget {
  static const routeName = '/bottombaranim';
  static const pageTitle = 'Animação de barra inferior';
  @override
  State createState() => new BottomBarAnimState();
}

class BottomBarAnimState extends State<BottomBarAnim>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BottomBarAnim.pageTitle),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Container(
            width: 1000,
            height: 200,
            child: FlareActor(
              "assets/MultiOptionButton.flr",
              animation: "deactivate",
            )),
      ),
    );
  }
}
