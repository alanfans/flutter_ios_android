import 'package:flutter/material.dart';

class ListViewSeparated extends StatefulWidget {
  @override
  _ListViewSeparatedState createState() => _ListViewSeparatedState();
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  Divider blueColor = Divider(color: Colors.blue);
  Divider redColor = Divider(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: Icon(Icons.people),
            title: Text('联系人${index+1}'),
            subtitle: Text("联系人电话${index+1}"),
          );
        },
        separatorBuilder: (BuildContext context,int index){
          return index % 2 == 0 ? blueColor : redColor;
        },
        itemCount:100
    );
  }
}
