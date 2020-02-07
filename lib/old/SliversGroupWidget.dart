import 'package:flutter/material.dart';
class SliversGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showCustomScrollView();
  }

  Widget showCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Coderwhy Demo"),
            background: Image(
                image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
                fit: BoxFit.cover,
            ),
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context,int index){
                  return  Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('gird item $index'),
                  );
                },
              childCount: 10
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0
            )
        ),
        SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
                (BuildContext count,int index){
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('List item $index'),
                  );
                },
              childCount: 20
            ),
            )
      ],
    );
  }
}
