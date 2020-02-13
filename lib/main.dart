import 'package:flutter/material.dart';
import './Screens/loaderanim.dart';
import './Screens/listviewapi.dart';
import './Screens/riveanim.dart';
import './Screens/bottombaranimation.dart';
import './Screens/marvelheroes.dart';

void main() {
  runApp(new MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<String> telas = [
    "Repositório de testes",
    "Lista populada por Rest API",
    "Flutter loading animation",
    "Animação de um switch utilizando Rive.app",
    "Barra inferior de navegação utilizando Rive.app",
    "Lista de heróis da Marvel"
  ];
  String telaAtual = telas[0].toString();
  int paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(telaAtual),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              this.setState(() {
                telaAtual = telas[0];
              });
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: telaAtual == telas[0]
          ? ListView.builder(
              itemCount: telas == null ? 0 : telas.length,
              itemBuilder: (BuildContext context, int index) {
                return telas[index] == telas[0]
                    ? Container()
                    : RaisedButton(
                        child: Text(telas[index]),
                        onPressed: () {
                          this.setState(() {
                            telaAtual = telas[index];
                          });
                        });
              })
          : telaAtual == telas[1]
              ? Container(child: ApiList())
              : telaAtual == telas[2]
                  ? Container(child: new Center(child: Loader()))
                  : telaAtual == telas[3]
                      ? Container(child: RiveAnim())
                      : telaAtual == telas[4]
                          ? Container(child: BottomBarAnim())
                          : telaAtual == telas[5]
                              ? Container(child: MarvelHeroes())
                              : Container(
                                  color: Colors.red,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
    );
  }
}

//BottomBarAnim
