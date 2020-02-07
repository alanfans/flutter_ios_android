import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {

  ScrollController _controller;
  bool _isShowTop = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener((){
      var tempSsShowTop = _controller.offset >= 1000;
      if(tempSsShowTop != _isShowTop){
        setState(() {
          _isShowTop = tempSsShowTop;
        });
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Show'),
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemExtent: 60,
          itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text('item$index'));
      }),
      floatingActionButton: !_isShowTop ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: (){
            _controller.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
      }),
    );
  }


}
