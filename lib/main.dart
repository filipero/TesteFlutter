import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import './Screens/loaderanim.dart';
import './Screens/listviewapi.dart';
import './Screens/riveanim.dart';
import './Screens/bottombaranimation.dart';
import './Screens/marvelheroes.dart';
import './system/theme.dart';
import './Screens/toast.dart';
import './Screens/draggableitems.dart';

void main() {
  runApp(OKToast(child: MaterialApp(theme: temaPadrao, home: HomePage())));
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
    "Lista de heróis da Marvel",
    "Toast notifications",
    "Draggable items"
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
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              });
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        color: temaPadrao.backgroundColor,
        child: telaAtual == telas[0]
            ? ListView.builder(
                itemCount: telas == null ? 0 : telas.length,
                itemBuilder: (BuildContext context, int index) {
                  return telas[index] == telas[0]
                      ? Container()
                      : Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          height: 50,
                          child: RaisedButton(
                              child: Text(telas[index]),
                              onPressed: () {
                                this.setState(() {
                                  telaAtual = telas[index];
                                });
                              }),
                        );
                })
            : telaAtual == telas[1]
                ? ApiList()
                : telaAtual == telas[2]
                    ? new Center(child: Loader())
                    : telaAtual == telas[3]
                        ? RiveAnim()
                        : telaAtual == telas[4]
                            ? BottomBarAnim()
                            : telaAtual == telas[5]
                                ? MarvelHeroes()
                                : telaAtual == telas[6]
                                    ? ToastNotify()
                                    : telaAtual == telas[7]
                                        ? DraggableItems()
                                        : Container(
                                            color: Colors.red[600],
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
      ),
    );
  }
}
