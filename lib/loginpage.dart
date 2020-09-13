import 'package:calendarly/calendar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'authentication.dart';
import 'dart:math' as math; //spent 2 hours on this smfh

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, //acts up bare without this
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
                  //Icon(Icons.calendar_today, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2))
                            ]),
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0)),
                          color: Colors.blue,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Sign into My Account",
                                  style: GoogleFonts.breeSerif(
                                      color: Colors.white, fontSize: 18.0))),
                          onPressed: null),
                      SignInButtonBuilder(
                        text: "Sign up with Email",
                        textColor: Colors.white,
                        icon: Icons.mail,
                        onPressed: () {},
                        backgroundColor: Colors.grey,
                        fontSize: 18.0,
                      ),
                      SignInButton(Buttons.Google,
                          text: "Sign up with Google", onPressed: () {})
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ignore this bs
class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() => _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Image.asset('assets/images/calendarlogo.png')),
        ));
  }
}

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => new _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Welcome to Calendarly',
//               style:
//                   GoogleFonts.breeSerif(fontSize: 22.0, color: Colors.white)),
//         ),
//         body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
// RaisedButton(
// shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10.0)),
// color: Colors.blue,
// child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Text("Register",
//         style: GoogleFonts.breeSerif(
//             color: Colors.white, fontSize: 20.0))),
// onPressed: null),
// SignInButtonBuilder(
//   text: "Sign up with Email",
//   textColor: Colors.white,
//   icon: Icons.mail,
//   onPressed: () {},
//   backgroundColor: Colors.blueGrey,
// ),
//               SizedBox(height: 20.0), //Space between the 2 buttons
//               SignInButton(Buttons.Google, text: "Sign up with Google",
//                   onPressed: () {
//                 signInWithGoogle().then((result) {
//                   if (result != null) {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return HomePage();
//                         },
//                       ),
//                     );
//                   }
//                 });
//               })
//             ])));
//   }
// }
