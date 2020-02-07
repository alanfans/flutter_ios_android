import 'package:flutter/material.dart';

class MyPic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
                "https://img.hacpai.com/bing/20191204.jpg",
                alignment: Alignment.topCenter,
                repeat: ImageRepeat.repeatY,
                //color: Colors.red,
                colorBlendMode: BlendMode.colorDodge,
              ),
//           child: Image.asset("images/p1800813767.jpg"),
              width: 300,
              height: 300,
              color: Colors.yellow,
          ),
          Image.asset("images/p1800813767.jpg"),
          CircleAvatar(
              backgroundImage: NetworkImage("https://img.hacpai.com/bing/20191204.jpg"),
              radius: 100,
              child: Container(
                alignment: Alignment(0, .5),
                width: 200,
                height: 200,
                child: Text("兵长利威尔大象"),
              ),
          ),
          ClipOval(
            child: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
              width: 200,
              height: 200,),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
              width: 200,
              height: 200),

          )
        ],
      ),
    );
  }
}