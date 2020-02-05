import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
    home:HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.arrow_back)
      ),
      body: ListView(
        children:<Widget>[
          Card(
          child:Row(
            children: <Widget>[

              Container(color: Colors.green,height: 10,width:400,)
              
            ],
          )),
        ],
      ),
    );
  }
}