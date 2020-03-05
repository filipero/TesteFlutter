import 'package:flutter/material.dart';
import '../Widgets/moveablestackitem.dart';

class DraggableItems extends StatefulWidget {
  static const routeName = '/draggableitems';
  static const pageTitle = 'Itens arrastáveis';
  @override
  _DraggableItemsState createState() => _DraggableItemsState();
}

class _DraggableItemsState extends State<DraggableItems> {
  List<Widget> movableItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DraggableItems.pageTitle),
      ),
      body: Container(
        child: Container(
          child: Stack(children: <Widget>[
            Stack(
              children: movableItems,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    movableItems.add(MoveableStackItem());
                  });
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
/*


        */
