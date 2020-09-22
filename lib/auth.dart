import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

//Set up instances
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

showErrorDialog(BuildContext context, String error) {
  // to hide the keyboard, if it is still p
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text("Error"),
      content: Text(error),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        ),
      ],
    ),
  );
}

Future<User> signInWithGoogle() async {
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
  return user;
}

Future<User> signUp(String email, String password, BuildContext context) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: email);
    User user = result.user;
    return Future.value(user);
  } catch (e) {
    switch (e.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        showErrorDialog(context, "Email Already Exists");
        break;
      case 'ERROR_INVALID_EMAIL':
        showErrorDialog(context, "Invalid Email Address");
        break;
      case 'ERROR_WEAK_PASSWORD':
        showErrorDialog(context, "Please choose a stronger password");
        break;
    }
    return Future.value(null);
  }
}

Future<User> signIn(String email, String password, BuildContext context) async {
  try {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return Future.value(user);
  } catch (e) {
    print(e.code);
    switch (e.code) {
      case 'ERROR_INVALID_EMAIL':
        showErrorDialog(context, e.code);
        break;
      case 'ERROR_WRONG_PASSWORD':
        showErrorDialog(context, e.code);
        break;
      case 'ERROR_USER_NOT_FOUND':
        showErrorDialog(context, e.code);
        break;
      case 'ERROR_USER_DISABLED':
        showErrorDialog(context, e.code);
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        showErrorDialog(context, e.code);
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        showErrorDialog(context, e.code);
        break;
    }

    return Future.value(null);
  }
}

signOut() async {
  await FirebaseAuth.instance.signOut();
}
