 import 'package:flutter/cupertino.dart';

class ProductItem extends StatelessWidget{

  final String titile;
  final String desc;
  final String imgUrl;

  ProductItem(this.titile, this.desc, this.imgUrl);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Column(
        children: <Widget>[
          Text(titile,style: TextStyle(fontSize: 24)),
          Text(desc,style: TextStyle(fontSize: 20)),
          SizedBox(height: 10,),
          Image.network(imgUrl)
        ],
      ),
    );
  }

}