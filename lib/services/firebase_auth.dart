import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FireBaseAuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<bool> registerUserWithEmailAndPassword(
      String email, String password) async {
    bool isAuthenticated = false;
    UserCredential user;

    try {
      user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        isAuthenticated = true;
      }
      return isAuthenticated;
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
      );
      return isAuthenticated;
    }
  }

  static Future<bool> loginWithEmailAndPassword(
      String email, String password) async {
    bool isAuthenticated = false;
    UserCredential user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {}
      return true;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email' || error.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: "The username or password is invalid.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
        );
      } else if (error.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: "The user not found.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
        );
      }
      return false;
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Something went wrong.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  User getSignedInUsers() {
    try {
      User _user = _auth.currentUser;
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
