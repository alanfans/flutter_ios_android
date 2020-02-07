import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {

  final TextStyle textStyle = TextStyle(fontSize: 20,color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return ListView(

      //itemExtent: 100,
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。",style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人活在世界上，不可以有偏差，而且多少要费点劲，才能把自己保持到理性的轨道上。",style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。",style: textStyle),
        ),
        ListTile(
          leading: Icon(Icons.people,size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.email,size: 36,color: Color(0xff000000),),
          title: Text("邮箱"),
          subtitle: Text("邮箱地址信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.message,size: 36,),
          title: Text("消息"),
          subtitle: Text("消息详情信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.map,size: 36,),
          title: Text("地址"),
          subtitle: Text("地址详情信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
