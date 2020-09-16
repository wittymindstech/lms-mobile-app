import 'package:google_sign_in/google_sign_in.dart';

import '../components/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

//handle Sign out
  handleLogout(BuildContext context, key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    Navigator.popAndPushNamed(context, "/login");
  }

// forget password
  Future<void> resetPassword(String email, key) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (signUpError) {
      getMyDatya(key, signUpError);
    }
  }

//user Signin
  Future signInWithEmailNdPassword(key, email, password, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("googleUserEmail", email);
        Navigator.pushReplacementNamed(context, '/Category');
      });
    } catch (signUpError) {
      getMyDatya(key, signUpError);
    }
  }

//user SignUP
  createUser(key, email, password, context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("googleUserEmail", email);
        Navigator.pushReplacementNamed(context, '/Category');
      });
    } catch (signUpError) {
      getMyDatya(key, signUpError);
    }
  }

// user sign up with google
  Future<String> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

//Facebook Login
  getMyFacebookLogin({BuildContext context, key}) async {
    final facebookLogin = FacebookLogin();
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User currentUser;

    try {
      final result = await facebookLogin.logIn(["email"]);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          FacebookAccessToken facebookAccessToken = result.accessToken;
          final AuthCredential credential =
              FacebookAuthProvider.credential(facebookAccessToken.token);
          // final AuthCredential credential = FacebookAuthProvider.getCredential(
          //     accessToken: facebookAccessToken.token);
          User firebaseUser =
              (await firebaseAuth.signInWithCredential(credential)).user;
          print("twitter sign in" + firebaseUser.toString());
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/Category');
          break;
        case FacebookLoginStatus.cancelledByUser:
          throw Exception();
          break;
        case FacebookLoginStatus.error:
          throw Exception();
          break;
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}

// onError in sign in or sign up
getMyDatya(key, myError) {
  if (myError is PlatformException) {
    switch (myError.code) {
      case "ERROR_OPERATION_NOT_ALLOWED":
        showSnackbar(key, "Anonymous accounts are not enabled", Colors.red);
        break;
      case "ERROR_WEAK_PASSWORD":
        showSnackbar(key, "Your password is too weak", Colors.red);
        break;
      case "ERROR_INVALID_EMAIL":
        showSnackbar(key, "Your email is invalid", Colors.red);
        break;
      case "ERROR_WRONG_PASSWORD":
        showSnackbar(key, "Your password is wrong.", Colors.red);
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        showSnackbar(
            key, "Email is already in use by different account", Colors.red);
        break;
      case "ERROR_INVALID_CREDENTIAL":
        showSnackbar(key, "Your email is invalid", Colors.red);
        break;
      case "error":
        showSnackbar(key, "Something wrong!", Colors.red);
        break;
      case "ERROR_USER_NOT_FOUND":
        showSnackbar(key, "User Not Found", Colors.red);
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        showSnackbar(key, "Too Many request try after sometime.", Colors.red);
        break;
      default:
        showSnackbar(key, "Something wrong!", Colors.red);
        break;
    }
  }
}
