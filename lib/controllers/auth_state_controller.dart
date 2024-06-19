import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  final _authInstance = FirebaseAuth.instance;
  final Rx<User?> _user = Rx<User?>(null);

  @override
  void onReady() {
    super.onReady();
    _authState();
  }

  void _authState() {
    _user.value = _authInstance.currentUser;
    if (_user.value == null) {
      debugPrint("User is logged out");
    } else {
      debugPrint("${_user.value?.email} is logged in");
    }
  }

  Future<void> signUpWithEmailandPass(
      {required String email, required String password}) async {
    try {
      await _authInstance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint("signUpWithEmailandPass(FirebaseAuthException):$e");
    } catch (e) {
      debugPrint("signUpWithEmailandPass:$e");
    }
  }

  Future<void> loginWithEmailandPass(
      {required String email, required String password}) async {
    try {
      await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      _authState();
    } on FirebaseAuthException catch (e) {
      debugPrint("loginWithEmailandPass(FirebaseAuthException):$e");
    } catch (e) {
      debugPrint("loginWithEmailandPass:$e");
    }
  }

  Future<void> signOut() async {
    await _authInstance.signOut();
    _user.value == null;
  }

  Future<void> deleteAc() async {
    if (_user.value != null) {
      await _user.value?.delete();
    } else {
      debugPrint("User not logged in");
    }
  }
}
