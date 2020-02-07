import 'package:flutter/material.dart';

class MyForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFieldDemo(),
        ],
      ),
    );
  }

}

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final  textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    textEditingController.text = "Hello World";

    textEditingController.addListener((){
      print("textEditingController: ${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: "username",
        hintText: "请输入用户名",
        border: InputBorder.none,
        //filled: true,
        //fillColor: Colors.lightGreen
      ),
      onChanged: (value){
        print("onChanged: $value");
      },
      onSubmitted: (value){
        print("onSubmitted: $value");
      },
    );
  }


}