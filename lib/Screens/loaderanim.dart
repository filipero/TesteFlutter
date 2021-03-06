import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  static const routeName = '/loader';
  static const pageTitle = 'Animação de carregamento Flutter';
  @override
  State createState() => new LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
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
    return Scaffold(
        appBar: AppBar(
          title: Text(Loader.pageTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.blue,
              height: 3.0,
              width: animation.value * 100,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.blue,
              height: 3.0,
              width: animation.value * 75,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              color: Colors.blue,
              height: 3.0,
              width: animation.value * 50,
            ),
          ],
        ));
  }
}
