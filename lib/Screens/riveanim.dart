import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class RiveAnim extends StatefulWidget {
  @override
  State createState() => new RiveAnimState();
}

class RiveAnimState extends State<RiveAnim>
    with SingleTickerProviderStateMixin {
  int index = 0;

  List<String> animations = [
    "night_idle",
    "switch_day",
    "day_idle",
    "switch_night"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          this.setState(() {
            index == 3 ? index = 0 : index++;
            index == 1
                ? Timer(Duration(milliseconds: 500), () {
                    setState(() {
                      index++;
                    });
                  })
                : null;
            index == 3
                ? Timer(Duration(milliseconds: 500), () {
                    setState(() {
                      index = 0;
                    });
                  })
                : null;
          });
        },
        child: FlareActor(
          "assets/switch_daytime.flr",
          animation: animations[index],
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
