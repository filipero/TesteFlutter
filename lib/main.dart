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

  int paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlatButton(onPressed:(){
                  this.setState((){
                    paginaAtual < 3 ? paginaAtual++ : paginaAtual = 0;
                  });},child: Icon(Icons.arrow_back, color: Colors.white,),)
      ),
      body: paginaAtual == 0 ? ListView(
        children:<Widget>[
          Card(
          child:Row(
            children: <Widget>[
              
              RaisedButton(child: Text('Nome do teste'),
                onPressed: (){
                  this.setState((){
                    paginaAtual < 3 ? paginaAtual++ : paginaAtual = 0;
                  });
                })
              
              
            ],
          )),
        ],
      ): paginaAtual == 1 ?Container(color: Colors.black,height: 100, width: 100,):Container(color: Colors.amber,height: 100, width: 100),
    );
  }
}