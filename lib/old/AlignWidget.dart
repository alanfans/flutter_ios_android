import 'package:flutter/material.dart';

class AlignWidgete extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Icon(
        Icons.pets,
        size: 36,
        color: Colors.red,
      ),
      //alignment: Alignment.bottomRight,
      widthFactor: 3,
      heightFactor: 3,
    );;
  }
}

class PaddingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 18
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: Color.fromRGBO(3, 3, 255, .5),
        width: 100,
        height: 100,
        child: Icon(
          Icons.pets,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BoxDecorationWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 150,
        height: 150,
          child: Icon(Icons.pets,size: 32,color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          border: Border.all(
            color: Colors.redAccent,
            width: 1,
            style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              offset: Offset(5,5),
              color: Colors.purple,
              blurRadius: 9
            )
          ],
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.red
            ]
          )
        ),
      ),
    );
  }
}