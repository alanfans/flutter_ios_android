import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text("FloatActionButton"),
          onPressed: (){
            print("FloatActionButton Click");
          }),
        RaisedButton(
            child:Text("RaisButton"),
            onPressed: (){
              print("RaisButton click");
        }),
        FlatButton(
            child: Text("FlatButton"),
            onPressed: (){
              print("FlatButton click");
            }),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: (){
            print("OutlineButton click");
          }),
        RaisedButton(
          child: Text("同意协议",style: TextStyle(color: Colors.white),),
          color: Colors.orange,
          elevation: 5.5,
          highlightColor: Colors.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: (){
              print("agree");
          },
        )
      ],
    );
  }

}