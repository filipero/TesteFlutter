import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class RiveAnim extends StatefulWidget {
  static const routeName = '/riveanim';
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
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: Text('Aperte no Switch para mudar o estado')),
          Container(
            height: 40,
            width: 80,
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
                      : Timer(Duration(milliseconds: 500), () {
                          setState(() {
                            index = 0;
                          });
                        });
                });
              },
              child: FlareActor(
                "assets/switch_daytime.flr",
                animation: animations[index],
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
