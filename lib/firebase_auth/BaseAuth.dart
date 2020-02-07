import 'dart:async';

import 'package:flutter_ios_android/firebase_auth/AuthUser.dart';
//import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{

  String signIn(String email,String password);

//  Future<String> signUp(String email,String password);

  Future<void> signOut();

  AuthUser getCurrentUser();

//  Future<void> sendEmailVerification();
//
//  Future<bool> isEmailVerified();
}