import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  //Takes the user's credentials and authenticates it against Firebase
  final UserCredential authResult = await auth.signInWithCredential(credential);
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = auth.currentUser;
  assert(currentUser.uid == user.uid);
  print(
      'signInWithGoogle succeeded: $user'); //to see if the user is signed in successfully
  return user.uid;
}

Future<String> signUp(String email, String password) async {
  User user;
  String errorMessage;

  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    user = result.user;
  } on PlatformException catch (error) {
    switch (error.code) {
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Anonymous accounts are not enabled";
        break;
      case "ERROR_WEAK_PASSWORD":
        errorMessage = "Your password is too weak";
        break;
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Your email is invalid";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = "Email is already in use on different account";
        break;
      case "ERROR_INVALID_CREDENTIAL":
        errorMessage = "Your email is invalid";
        break;

      default:
        errorMessage = "An undefined Error happened.";
    }
  }
  if (errorMessage != null) {
    return Future.error(errorMessage);
  }

  return user.uid;
}

Future<String> signIn(String email, String password) async {
  User user;
  String errorMessage;

  try {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    user = result.user;
  } on PlatformException catch (error) {
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Your password is wrong.";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
  }

  if (errorMessage != null) {
    return Future.error(errorMessage);
  }

  return user.uid;
}

signOut() async {
  await FirebaseAuth.instance.signOut();
}
