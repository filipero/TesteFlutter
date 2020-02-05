import 'package:flutter/material.dart';
import './Screens/loaderanim.dart';
import './Screens/listviewapi.dart';
import './Screens/riveanim.dart';
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

  List<String> telas = ["HomePage","Lista populada por Rest API","Flutter loading animation","Rive animation"];
  String telaAtual = "HomePage";
  int paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(telaAtual)
                  ,actions: <Widget>[
                    FlatButton(onPressed:(){
                  this.setState((){
                    telaAtual = "HomePage";
                  });},child: Icon(Icons.home, color: Colors.white,),)
                  ],
      ),
      body: telaAtual == telas[0] ? ListView.builder(itemCount: telas == null ? 0 : telas.length,
      itemBuilder: (BuildContext context, int index){
        return telas[index] == "HomePage" ? Container() : RaisedButton(child: Text( telas[index] ),
                onPressed: (){
                  this.setState((){
                    telaAtual = telas[index];
                  });
                });

      }
      
      ): 
      telaAtual == telas[1] ? Container(child:ApiList()):
      telaAtual == telas[2] ? Container(child:new Center(child: Loader())):
      telaAtual == telas[3] ? Container(child:RiveAnim()):
      Container(color: Colors.red,height: double.infinity, width: double.infinity,),
    );
  }
}





/* ListView(
        children:<Widget>[
          Card(
          child:Row(
            children: <Widget>[
              
              RaisedButton(child: Text( telas[1] ),
                onPressed: (){
                  this.setState((){
                    telaAtual = telas[1];
                  });
                })
              
              
            ],
          )),
        ],
      ) */