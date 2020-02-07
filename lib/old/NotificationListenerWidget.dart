import 'package:flutter/material.dart';
class NotificationListenerWidget extends StatefulWidget {
  @override
  _NotificationListenerState createState() => _NotificationListenerState();
}

class _NotificationListenerState extends State<NotificationListenerWidget> {
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (ScrollNotification notification){
          if(notification is ScrollStartNotification){
            print("开始滚动。。。。");
          }else if(notification is ScrollUpdateNotification){
            final currentPixel = notification.metrics.pixels;
            final totalPixel = notification.metrics.maxScrollExtent;
            double progress = currentPixel / totalPixel;
            setState(() {
              _progress = (progress * 100).toInt();
            });
            print("正滚动：${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
          } else if (notification is ScrollEndNotification){
            print("结束滚动。。。。。");
          }
        },
      child: Stack(
        alignment: Alignment(9, 9),
        children: <Widget>[
          ListView.builder(
            itemBuilder: (BuildContext conext,int index){
                return ListTile(title: Text("item$index"));
            },
            itemExtent: 60,
            itemCount: 100,
          ),
          CircleAvatar(
            radius: 30,
            child: Text("$_progress"),
            backgroundColor: Colors.black54,
          )
        ],
      ),
    );
  }
}
