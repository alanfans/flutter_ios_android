import 'package:flutter/material.dart';
import 'package:flutter_ios_android/old/json/Data.dart';

class StackWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.purple,
          width: 300,
          height: 300,

        ),
        Positioned(
          left: 20,
          top: 20,
          child: Icon(
            Icons.favorite,
            size: 50,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Text(
            "你好啊，李银河",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }

}