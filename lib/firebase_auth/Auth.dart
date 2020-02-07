//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ios_android/firebase_auth/AuthUser.dart';
import 'package:flutter_ios_android/firebase_auth/BaseAuth.dart';
import 'package:flutter_ios_android/firebase_auth/ShareData.dart';
import 'package:flutter_ios_android/firebase_auth/httpUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DioManager.dart';

class Auth implements BaseAuth{

  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  AuthUser getCurrentUser()  {
    // TODO: implement getCurrentUser
    AuthUser user =  ShareData().getData("AuthUser");
    return user;
  }

//  @override
//  Future<bool> isEmailVerified() async {
//    // TODO: implement isEmailVerified
//    AuthUser user =  ShareData().getData("AuthUser");
//    return user.isEmailVerified;
//  }

//  @override
//  Future<void> sendEmailVerification() async {
//    // TODO: implement sendEmailVerification
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    user.sendEmailVerification();
//  }

  @override
  String signIn(String email, String password)  {
    AuthUser authUser = null;

    // TODO: implement signIn
//    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
//        email: email, password: password);

    try {

      Map<String, dynamic> params = {"userName":email,"userPassword":password};
      AuthUser authUser =  getCurrentUser();
        if( null == authUser){
          DioManager().post(HttpUrl.loginUri, params,(data){
            // print(data.runtimeType);
            authUser = AuthUser.fromJson(data);
            ShareData().setData("AuthUser", authUser.token);
            ShareData().setData("userName", authUser.userName);
            return authUser.token;
          },(error){
            print(error.toString());
          });
        }
    } catch (e) {
      print(e);
    }
    //result = await _firebaseAuth.signInWithCustomToken(token: token);
    //FirebaseUser user = result.user;
    return null;
  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    return ShareData().removeKey("AuthUser");
  }

//  @override
//  Future<String> signUp(String email, String password) async {
//    // TODO: implement signUp
//    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//        email: email, password: password);
//    FirebaseUser user = result.user;
//    return user.uid;
//  }

}