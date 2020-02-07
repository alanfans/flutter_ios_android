import 'package:flutter/material.dart';


import 'json/Data.dart';
import 'json/Data_service.dart';
class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<Data> dataLists = [];


  @override
  void initState() {
    super.initState();
    decodeDataList().then((_) => {
      setState(() {
        this.dataLists = _.dataList;
      })
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GridView.builder(
        shrinkWrap: true,
          physics: ClampingScrollPhysics(),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1
          ),
          itemCount: dataLists.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              color: Colors.lightGreen,
              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(dataLists[index].code),
                  Text(dataLists[index].name),
                  Text(dataLists[index].province),
//                  Text(dataLists[index].city),
//                  Text(dataLists[index].area),
//                  Text(dataLists[index].town),

                ],
              ),
            );
          }),
    );
  } //  @override
//  Widget build(BuildContext context) {
//    return GridView(
//      shrinkWrap: true,
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 5,
//        mainAxisSpacing: 1,
//        crossAxisSpacing: 1,
//        childAspectRatio: 1.0
//      ),
//      children: getGridWidgets(),
//    );
//  }

  List<Widget> getGridWidgets() {
    return List.generate(100, (_){
      return Container(
        color: Colors.lightGreen,
        alignment: Alignment(0, 0),
        child: Text("item$_",style: TextStyle(fontSize: 20,color: Colors.white),),
      );
    });
  }
}
