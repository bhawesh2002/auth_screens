import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  final _authInstance = FirebaseAuth.instance;
  final Rx<User?> _user = Rx<User?>(null);

  //getter to get user
  User? get user => _user.value;

  //override onReady method
  //to check if user is logged in or not
  //when the controller is ready
  @override
  void onReady() {
    _authState();
    super.onReady();
  }

  //_authState method to check if user is logged in or not
  void _authState() async {
    updateUserState();
    if (_user.value == null) {
      debugPrint("_authState():User is logged out");
    } else {
      debugPrint("_authState():${_user.value?.email} is logged in");
      await _resetApp();
    }
  }

  //signUpWithEmailandPass method to sign up user with email and password
  Future<void> signUpWithEmailandPass(
      {required String email, required String password}) async {
    try {
      await _authInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      updateUserState();
    } on FirebaseAuthException catch (e) {
      debugPrint("signUpWithEmailandPass(FirebaseAuthException):$e");
    } catch (e) {
      debugPrint("signUpWithEmailandPass:$e");
    }
  }

  //loginWithEmailandPass method to login user with email and password
  Future<void> loginWithEmailandPass(
      {required String email, required String password}) async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      //update _user with the currently logged in user
      updateUserState();
    } on FirebaseAuthException catch (e) {
      debugPrint("loginWithEmailandPass(FirebaseAuthException):$e");
    } catch (e) {
      debugPrint("loginWithEmailandPass:$e");
    }
  }

  //signOut method to sign out user
  Future<void> signOut() async {
    try {
      debugPrint("signOut():Signing Out ${_user.value?.email}");
      await _authInstance.signOut();
      updateUserState();
    } catch (e) {
      debugPrint("signOut():$e");
    }
  }

  //deleteAc method to delete user account
  Future<void> deleteAc() async {
    try {
      if (_user.value != null) {
        debugPrint("deleteAc(): Deleting ${_user.value?.email}");
        await _user.value?.delete();
      } else {
        debugPrint("deleteAc(): User not logged in");
      }
    } catch (e) {
      debugPrint("deleteAc():$e");
    }
  }

  Future<void> _resetApp() async {
    try {
      if (_user.value != null) {
        debugPrint("resetApp(): Initiating reset");
        await deleteAc();
        await signOut();
        debugPrint("resetApp(): Reset Completed");
      }
    } catch (e) {
      debugPrint("resetApp(): $e");
    }
  }

  // Method to update the user state
  void updateUserState() {
    _user.value = _authInstance.currentUser;
  }
}
