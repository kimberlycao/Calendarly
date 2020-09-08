/* import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Global variables
FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();

//Method that handles Google sign in on the login page
Future<bool> googleLogIn() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await auth.signInWithCredential(credential);

    User user = await auth.currentUser();
    print(user.uid);

    return Future.value(true);
  }
}
 */
