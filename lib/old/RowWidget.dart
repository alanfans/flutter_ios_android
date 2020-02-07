import 'package:flutter/material.dart';
import 'package:flutter_ios_android/old/CameraApp.dart';

class RowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(flex: 1,child: Container(color: Colors.red,width: 60,height: 60,)),
        Container(color: Colors.blue,width: 80,height: 80,),
        Container(color: Colors.green,width: 70,height: 70),
        Expanded(flex: 1,child: Container(color: Colors.orange,width: 100,height: 100,)),
        RaisedButton(
          child:Text("openCamer"),
          onPressed: (){
            openCameras();
          },
        )
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Expanded(flex: 1,child: Container(color: Colors.red,width: 60,height: 60,)),
        Container(color: Colors.blue,width: 80,height: 80,),
        Container(color: Colors.green,width: 70,height: 70,),
        Expanded(flex: 1,child: Container(color: Colors.orange,width: 100,height: 100,))
      ],
    );
  }

}