import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FireBaseAuthService {
  static final _auth = FirebaseAuth.instance;
  static UserCredential user;

  static Future<bool> registerUserWithEmailAndPassword(
      String email, String password) async {
    bool isAuthenticated = false;

    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        isAuthenticated = true;
      }
      return isAuthenticated;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email' || error.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "The username or password is invalid.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
        );
      }
      return isAuthenticated;
    } catch (error) {
      Fluttertoast.showToast(
        msg: error,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
      );
      return isAuthenticated;
    }
  }
}
