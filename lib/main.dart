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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                  body1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  body2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  title: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold),
                )),
        // home: CategoriesScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomePage(),
          MarvelHeroes.routeName: (ctx) => MarvelHeroes(),
          ApiList.routeName: (ctx) => ApiList(),
          BottomBarAnim.routeName: (ctx) => BottomBarAnim(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => HomePage());
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Widget _buildList(context, routeName) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, routeName),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          routeName,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: ListView(
        children: <Widget>[
          _buildList(context, ApiList.routeName),
          _buildList(context, MarvelHeroes.routeName),
          _buildList(context, BottomBarAnim.routeName)
        ],
      ),
    );
  }
}
