import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormDemoState();
}

class _FormDemoState  extends State<FormDemo>{
  final registerFormKey = GlobalKey<FormState>();
  String username,password;

  void registerForm() {

    registerFormKey.currentState.save();
    //registerFormKey.currentState.validate();

    print("username:$username ,password:$password");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            autovalidate: true,
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: "用户名或手机号"
            ),
            onSaved: (value){
              this.username = value;
            },
            validator: (value){
              if(value == null || value.length == 0){
                return "请输入用户名或手机号";
              }
              return null;
            },
          ),
          TextFormField(
            autovalidate: true,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "密码"
            ),
            onSaved: (value){
              this.password = value;
            },
            validator: (value){
              if(value == null || value.length == 0){
                return "请输入密码";
              }
              return null;
            },
          ),
          SizedBox(height: 16,),
          Container(
              width: double.infinity,
              height: 44,
              child: RaisedButton(
                color: Colors.lightGreen,
                child: Text("注册",style: TextStyle(fontSize: 20,color: Colors.white),),
                onPressed: registerForm,
              )
          )
        ],
      ),
    );
  }


}