import 'package:flutter/services.dart';
import 'dart:convert';

import 'Data.dart';
import 'DataList.dart';

Future<String> _loadDataJson() async {
  return await rootBundle.loadString("assets/data.json");
}

Future<Data> decodeData() async {
   String dataJson = await _loadDataJson();

   final jsonMap = json.decode(dataJson);

   print('JsonMap runType is ${jsonMap.runtimeType}');

   Data data = Data.fromJson(jsonMap);

   print('Data name is ${data.name},code is ${data.code}');

   return data;
}

//List
Future<DataList> decodeDataList() async {
   String dataListJson = await _loadDataJson();

   List<dynamic> list = json.decode(dataListJson);

   DataList dataList = await DataList.fromJson(list);

   dataList.dataList.forEach((_) => print('data code is ${_.code},name is ${_.name}'));

   return dataList;
}