import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Auth {
  final FirebaseAuth _firebaseAuth;

  Auth(this._firebaseAuth);

  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var res = {
        "status": authResult.user != null,
        "result": authResult
      };
      return res;
    } catch (e) {
      var res = {
        "status": false,
        "result": e.message
      };
      return res;
    }
  }
}
