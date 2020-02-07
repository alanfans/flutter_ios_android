import 'package:flutter/material.dart';
import 'json/Data.dart';
import 'json/Data_service.dart';


class ListViewBuildWidget extends StatefulWidget {
  @override
  _ListViewBuildWidgetState createState() => _ListViewBuildWidgetState();
}

class _ListViewBuildWidgetState extends State<ListViewBuildWidget> {
  List<Data> dataList = [];


  @override
  void initState() {
//    getData().then((dataLists){
//      setState(() {
//        this.dataList = dataLists as List<Data>;
//      });
//    });
    super.initState();
    decodeDataList().then((_) => {
      setState(() {
        this.dataList = _.dataList;
      })
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (BuildContext context,int index){

        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text(dataList[index].code)),
              SizedBox(height: 8),
              Text(dataList[index].name,style: TextStyle(fontSize: 29),),
              SizedBox(height: 8),
              Text(dataList[index].province)
            ],
          ),
        );
      },
    );
  }
}
