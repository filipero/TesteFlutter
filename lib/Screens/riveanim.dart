import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class RiveAnim extends StatefulWidget {
  @override
  State createState() => new RiveAnimState();
}

class RiveAnimState extends State<RiveAnim> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: new Duration(milliseconds: 800), vsync: this);
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation.addListener(() {
      this.setState(() {});
    });

    animation.addStatusListener((AnimationStatus status) {});
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    /* new FlareActor("assets/Liquid_Loader.flr", 
    alignment:Alignment.center, 
    fit:BoxFit.contain, 
    animation:"idle");   */  
  }
}
