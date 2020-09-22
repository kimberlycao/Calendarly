import 'package:calendarly/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'auth.dart';
import 'homepage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity, //spans the entire width of the screen
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue[900],
            Colors.blue[700],
            Colors.blue[500],
            Colors.blue[300]
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Welcome to Calendarly!",
                      style: GoogleFonts.breeSerif(
                          fontSize: 40, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Sign In",
                        style: GoogleFonts.breeSerif(
                            fontSize: 30, color: Colors.white),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white60,
                                    blurRadius: 10.0,
                                    offset: Offset(0, 2))
                              ]),
                          height: 60.0,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 30.0),
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                                hintText: "Email",
                                hintStyle:
                                    GoogleFonts.breeSerif(color: Colors.white)),
                            validator: RequiredValidator(
                                errorText: "This Field Is Required"),
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white60,
                                    blurRadius: 10.0,
                                    offset: Offset(0, 2))
                              ]),
                          height: 60.0,
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 30.0),
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.white),
                                hintText: "Password",
                                hintStyle:
                                    GoogleFonts.breeSerif(color: Colors.white)),
                            validator: RequiredValidator(
                                errorText: "Password is required."),
                            onChanged: (val) {
                              password = val;
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)),
                            color: Colors.blue,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Sign into My Account",
                                    style: GoogleFonts.breeSerif(
                                        color: Colors.white, fontSize: 18.0))),
                            onPressed: () {
                              signIn(email.trim(), password, context)
                                  .whenComplete(() => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => HomePage())));
                            }),
                        SignInButtonBuilder(
                          text: "Sign up with Email",
                          textColor: Colors.white,
                          icon: Icons.mail,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterWithEmail()));
                          },
                          backgroundColor: Colors.grey,
                          fontSize: 18.0,
                        ),
                        SignInButton(Buttons.Google,
                            text: "Sign up with Google", onPressed: () {
                          signInWithGoogle().whenComplete(() =>
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return HomePage();
                              })));
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
