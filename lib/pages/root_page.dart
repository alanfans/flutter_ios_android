import 'package:flutter/material.dart';
import 'package:flutter_ios_android/firebase_auth/AuthUser.dart';
import 'package:flutter_ios_android/firebase_auth/BaseAuth.dart';
import 'package:flutter_ios_android/pages/auth_status.dart';
import 'home_page.dart';
import 'login_signup_page.dart';
class RootPage extends StatefulWidget {
  final BaseAuth auth;

  RootPage({this.auth});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userToken = "";

  @override
  void initState() {
    super.initState();
    AuthUser user = widget.auth.getCurrentUser();
      setState(() {
        user != null ? _userToken = user?.token : null;
            authStatus =
                 user?.token == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
  }

  void loginCallBack(){
    AuthUser user = widget.auth.getCurrentUser();
     setState(() {
       _userToken = user.token.toString();
     });
  }

  void logoutCallBack() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userToken = "";
    });
  }

  void loginoutCallBack(){
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userToken = "";
    });
  }

  Widget buildWattingScreen(){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.NOT_DETERMINED:
        return buildWattingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignupPage(
          auth: widget.auth,
          loginCallBack: loginCallBack,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if(_userToken.isNotEmpty){
//          return Myapp1();
          return HomePage(
            userToken: _userToken,
            auth: widget.auth,
          //  logoutCallBack: logoutCallBack,
          );
        }
        break;
      default:
          return buildWattingScreen();
    }
  }



}
