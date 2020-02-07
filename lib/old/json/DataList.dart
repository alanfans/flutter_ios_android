import 'Data.dart';

class DataList {
  List<Data> dataList;

  DataList({this.dataList});

  factory DataList.fromJson(List<dynamic> listJson){
    List<Data> dataList = listJson.map((_) => Data.fromJson(_)).toList();
    return DataList(dataList: dataList);
  }

}