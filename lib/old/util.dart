import 'package:flutter/material.dart';
import 'package:flutter_ios_android/old/ProductItem.dart';


class MyStatelessWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Checkbox(
//                value: true,
//                onChanged: (value) => print("test")
//            ),
//            Text(
//              "同意协议",
//              textDirection: TextDirection.ltr,
//              style: TextStyle(
//                  fontSize: 20
//              ),
//            ),
//          ],
//        )
//    );
  return ListView(
    children: <Widget>[
      ProductItem("test1","apple1 desc","https://img.hacpai.com/bing/20191204.jpg"),
      ProductItem("test2","apple2 desc","https://img.hacpai.com/bing/20190807.jpg"),
      ProductItem("test3","apple3 desc","https://img.hacpai.com/bing/20191007.jpg")
    ],
  );
  }

}