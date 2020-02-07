import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class Data{
  String code;
  String name;
  String province;
  dynamic city;
  dynamic area;
  dynamic town;

  Data({this.code, this.name, this.province, this.city, this.area, this.town});

  factory Data.fromJson(Map<String,dynamic> parsedMap){
    return Data(
        code: parsedMap["code"],
        name: parsedMap["name"],
        province: parsedMap["province"],
        city: parsedMap["city"],
        area: parsedMap["area"],
        town:  parsedMap["town"]
    );
  }
}

Future<List<Data>> getData() async{
  // 读取json文件
  String jsonStr = await rootBundle.loadString("assets/data.json");

  // 转成List或Map类型
  final jsonResult = json.decode(jsonStr);

  //遍历List，并且转成Data对象放到另一个List中
  List<Data> dataList = new List();
  for(Map<String,dynamic> map in jsonResult){
    dataList.add(Data.fromJson(map));
  }

  return dataList;
}