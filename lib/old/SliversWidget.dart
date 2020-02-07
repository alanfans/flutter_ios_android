import 'package:flutter/material.dart';

import 'json/Data.dart';
import 'json/Data_service.dart';
class SliversWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverGrid(

                  delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                    return Container(
                      alignment: Alignment(0, 0),
                      color: Colors.orange,
                      child: Text("item$index"),
                    );
                  },
                  childCount: 20
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8
                  ),
              ),
            )
        )
      ],
    );
  }

}

class SliversWidget extends StatefulWidget {
  @override
  State createState() => _sliversWidget();
}

class _sliversWidget extends State<SliversWidget> {
   List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    decodeDataList().then((_) => {
      setState(() {
        this.dataList = _.dataList;
      })
    });

  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverGrid(

                delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                  return Container(
                    alignment: Alignment(0, 0),
                    color: Colors.orange,
                    child: Text("${dataList[index].name}"),
                  );
                },
                    childCount: dataList.length
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8
                ),
              ),
            )
        )
      ],
    );
  }
}

