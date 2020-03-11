import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import './Screens/loaderanim.dart';
import './Screens/listviewapi.dart';
import './Screens/riveanim.dart';
import './Screens/bottombaranimation.dart';
import './Screens/marvelheroes.dart';

import './Screens/toast.dart';
import './Screens/draggableitems.dart';
import './Widgets/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
          title: 'Repositório de testes',
          theme: ThemeData(
              primarySwatch: Colors.pink,
              accentColor: Colors.amber,
              canvasColor: Color.fromRGBO(255, 254, 229, 1),
              textTheme: ThemeData.light().textTheme.copyWith(
                    body1: TextStyle(
                      color: Color.fromRGBO(20, 51, 51, 1),
                    ),
                    body2: TextStyle(
                      color: Color.fromRGBO(20, 51, 51, 1),
                    ),
                    title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
          initialRoute: '/',
          routes: {
            '/': (ctx) => HomePage(),
            MarvelHeroes.routeName: (ctx) => MarvelHeroes(),
            ApiList.routeName: (ctx) => ApiList(),
            BottomBarAnim.routeName: (ctx) => BottomBarAnim(),
            ToastNotify.routeName: (ctx) => ToastNotify(),
            Loader.routeName: (ctx) => Loader(),
            RiveAnim.routeName: (ctx) => RiveAnim(),
            DraggableItems.routeName: (ctx) => DraggableItems(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => HomePage());
          }),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Widget _buildList(context, routeName, pageTitle) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, routeName),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pageTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showToastWidget(
        ToastWidget(
          title: 'Toasty',
          description: 'Write Better Toast',
        ),
        duration: Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página inicial'),
      ),
      body: ListView(
        children: <Widget>[
          _buildList(context, MarvelHeroes.routeName, MarvelHeroes.pageTitle),
          _buildList(context, ApiList.routeName, ApiList.pageTitle),
          _buildList(context, BottomBarAnim.routeName, BottomBarAnim.pageTitle),
          _buildList(context, ToastNotify.routeName, ToastNotify.pageTitle),
          _buildList(context, Loader.routeName, Loader.pageTitle),
          _buildList(context, RiveAnim.routeName, RiveAnim.pageTitle),
          _buildList(
              context, DraggableItems.routeName, DraggableItems.pageTitle),
        ],
      ),
    );
  }
}
