import 'package:flutter/material.dart';
import '../Widgets/moveablestackitem.dart';

class DraggableItems extends StatefulWidget {
  @override
  _DraggableItemsState createState() => _DraggableItemsState();
}

class _DraggableItemsState extends State<DraggableItems> {
  List<Widget> movableItems = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 500,
          child: Stack(
            children: movableItems,
          ),
        ),
        Container(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                movableItems.add(MoveableStackItem());
              });
            },
          ),
        )
      ],
    );
  }
}
