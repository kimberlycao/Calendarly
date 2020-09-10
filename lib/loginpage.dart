import 'package:calendarly/calendar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'authentication.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Welcome to Calendarly',
              style:
                  GoogleFonts.breeSerif(fontSize: 22.0, color: Colors.white)),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              /* RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.blue,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Register",
                      style: GoogleFonts.breeSerif(
                          color: Colors.white, fontSize: 20.0))),
              onPressed: null), */
              SignInButtonBuilder(
                text: "Sign up with Email",
                textColor: Colors.white,
                icon: Icons.mail,
                onPressed: () {},
                backgroundColor: Colors.blueGrey,
              ),
              SizedBox(height: 20.0), //Space between the 2 buttons
              SignInButton(Buttons.Google, text: "Sign up with Google",
                  onPressed: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  }
                });
              })
            ])));
  }
}
