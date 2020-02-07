import 'package:flutter/material.dart';
import 'package:flutter_ios_android/firebase_auth/Auth.dart';
import 'package:flutter_ios_android/firebase_auth/AuthUser.dart';
import 'package:flutter_ios_android/firebase_auth/BaseAuth.dart';

import 'auth_status.dart';
import 'camera.dart';
import 'login_signup_page.dart';
import 'root_page.dart';
class HomePage extends StatefulWidget {

  final BaseAuth auth;
  final VoidCallback logoutCallBack;
  final String userToken;

  HomePage({Key key,this.auth,this.userToken,this.logoutCallBack})
      : super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userToken = "";

  final _textEditingController = TextEditingController();
  @override
  void initState() {
    AuthUser user = widget.auth.getCurrentUser();
      setState(() {
        user != null ? _userToken = user?.token : null;
        authStatus =
        user?.token == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });

  }


  signOut() async {
    try {
      await widget.auth.signOut();
//      widget.logoutCallBack();
      Navigator.pop(context,MaterialPageRoute(builder: (context) =>
        RootPage(auth: Auth())
      ));
    } catch (e) {
      print(e);
    }
  }


  showAddTodoDialog(BuildContext context) async {
    _textEditingController.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                      controller: _textEditingController,
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Add new todo',
                      ),
                    ))
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Save'),
                  onPressed: () {
                   // addNewTodo(_textEditingController.text.toString());
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter login demo'),
          centerTitle: true,
          actions: <Widget>[
             FlatButton(
                child: Text('Logout',
                    style: TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body: Text("home"),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.looks_one), title: const Text('Widget 1'),
                onTap: () {
                  test();
                  //Navigator.pushNamed(context, '/widget1');

                  },),
              RaisedButton(
                  child: Text("test"),
                  onPressed: (){
                    print("asfas");

              }),
              Text('Option 2'),
              Text('Option 3'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddTodoDialog(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }

}
