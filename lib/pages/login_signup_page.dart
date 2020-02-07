import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_android/firebase_auth/AuthUser.dart';
import 'package:flutter_ios_android/firebase_auth/BaseAuth.dart';
import 'package:flutter_ios_android/pages/home_page.dart';
class LoginSignupPage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback loginCallBack;


  LoginSignupPage({this.auth,this.loginCallBack});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {

  final _formKey = new GlobalKey<FormState>();

  var _email = new TextEditingController();
  var _password = new TextEditingController();
  String _errorMessage = "";
  bool _isLoading;
  bool _isLoginForm;
  String userToken = "";


  @override
  void initState() {
    super.initState();
    _email.text = "alanfans";
    var content = new Utf8Encoder().convert("qDEeaSHzgCx9UAMj");
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    _password.text = hex.encode(digest.bytes);
    _errorMessage = '';
    _isLoading = false;
    _isLoginForm = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("黑客派"),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
            showCircularProgress(),
          ],
        )
    );
  }


  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }


  void toggleFormMode() {
    //resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }


  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }



  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _email,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email.text = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _password,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password.text = value.trim(),
      ),
    );
  }


  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showLogo(),
              showEmailInput(),
              showPasswordInput(),
              showPrimaryButton(),
              showSecondaryButton(),
              showErrorMessage(),
            ],
          ),
        ));
  }


  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('images/faviconh.png'),
        ),
      ),
    );
  }


  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }


  bool validateAndSave(){
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }else{
      return false;
    }
  }


  void logoutCallBack() {
    AuthUser user = widget.auth.getCurrentUser();
      setState(() {
        userToken = '';
      });

  }

  void validateAndSubmit() {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if(validateAndSave()){

      try{
        if(_isLoginForm){
          userToken = widget.auth.signIn(_email.text,_password.text);
          print("Signed in : $userToken");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage(
              userToken: userToken,
            auth: widget.auth,
            logoutCallBack: logoutCallBack)));
        }else{
//          userId = await widget.auth.signUp(_email.text, _password.text);
//          print("Signed up user: $userId");
            print("请前往黑客派注册!");
        }
        setState(() {
          _isLoading = false;
        });
        if(userToken.length > 0  && userToken != null && _isLoginForm){
          widget.loginCallBack();
        }
      }catch(e){
        print("Error: $e");
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }
}
