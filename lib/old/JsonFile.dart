import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ios_android/old/GridViewWidget.dart';
import 'package:flutter_ios_android/old/ListViewBuildWidget.dart';
import 'package:flutter_ios_android/old/ListViewSeparatedWidget.dart';
import 'package:flutter_ios_android/old/ListViewWidget.dart';

import 'NotificationListenerWidget.dart';
import 'ScrollWidget.dart';
import 'SliverGridDemo.dart';
import 'SliversGroupWidget.dart';
import 'SliversWidget.dart';

class JsonFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: Text("JsonFile"),
//      ),
//      body: JsonView(),
//    body: ListViewSeparated(),
//      body: ListViewBuildWidget(),
//      body: GridViewWidget(),
//    body: SliversWidget()
//      body: SliversGroup(),
//    body: ScrollWidget(),
    body: NotificationListenerWidget(),
      );


//    return JsonView();
  }
}

class JsonView extends StatefulWidget {
  @override
  _JsonViewState createState() => _JsonViewState();
}

class _JsonViewState extends State<JsonView> {
  @override
  Widget build(BuildContext context) {
//    return new FutureBuilder(
//      future: DefaultAssetBundle.of(context).loadString("assets/data1.json"),
//      builder: (context,snapshot){
//        if (snapshot.hasData) {
//          List<dynamic> data = json.decode(snapshot.data.toString());
//          return new ListView.builder(
//            itemCount: data.length,
//            itemBuilder: (BuildContext context,int index){
//              return Card(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    Text("Code: ${data[index]["code"]}"),
//                    Text("Name: ${data[index]["name"]}"),
//                    Text("Province: ${data[index]["province"]}"),
//                    Text("City: ${data[index]["city"]}"),
//                    Text("Area: ${data[index]["area"]}"),
//                    Text("Town: ${data[index]["town"]}"),
//                  ],
//                ),
//              );
//            },
//          );
//        }
//        return CircularProgressIndicator();
//      },
//    );
    return new FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> data = json.decode(snapshot.data.toString());

          return new ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
//                    new Text("Name: ${data[index]["name"]}"),
//                    new Text("Age: ${data[index]["age"]}"),
//                    new Text("Height: ${data[index]["height"]}"),
//                    new Text("Gender: ${data[index]["gender"]}"),
                    Text("Code: ${data[index]["code"]}"),
                    Text("Name: ${data[index]["name"]}"),
                    Text("Province: ${data[index]["province"]}"),
                    Text("City: ${data[index]["city"]}"),
                    Text("Area: ${data[index]["area"]}"),
                    Text("Town: ${data[index]["town"]}"),
                  ],
                ),
              );
            },
          );
        }
        return new CircularProgressIndicator();
      },
    );
  }
}

