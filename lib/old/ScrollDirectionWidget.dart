import 'package:flutter/material.dart';

class ScrollDiretionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 100,
      children: <Widget>[
        Container(color: Colors.red,width: 200),
        Container(color: Colors.green,width: 200),
        Container(color: Colors.blue,width: 200),
        Container(color: Colors.purple,width: 200),
        Container(color: Colors.cyan,width: 200),
        Container(color: Colors.yellowAccent,width: 200),
      ],
    );
  }
}
