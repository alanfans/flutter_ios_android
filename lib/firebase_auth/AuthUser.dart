class AuthUser{

  int sc;

  String msg;

  String userName;

  String token;

  AuthUser({this.sc,this.msg,this.userName,this.token});

  factory AuthUser.fromJson(Map<String,dynamic> parsedMap){
    return AuthUser(
        sc: parsedMap["sc"],
        msg: parsedMap["msg"],
        userName: parsedMap["userName"],
        token: parsedMap["token"]
    );
  }
}