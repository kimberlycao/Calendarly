import 'package:calendarly/Firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home_page.dart';

class RegisterWithEmail extends StatefulWidget {
  @override
  _RegisterWithEmailState createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void signUserUp() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      signUp(email.trim(), password.trim()).then((value) {
        if (value != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  Text("Register with Email",
                      style: GoogleFonts.breeSerif(fontSize: 30.0))
                ],
              ),
              SizedBox(height: 25.0),
              TextFormField(
                validator: validateEmail,
                style: GoogleFonts.breeSerif(fontSize: 18.0),
                decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(height: 25.0),
              Container(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    TextFormField(
                      obscureText: true,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "This Field Is Required."),
                        MinLengthValidator(6,
                            errorText:
                                "Password must be 8 characters in length!")
                      ]),
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          onPressed: signUserUp,
                          disabledColor: Colors.blue, //remove afterwards
                          child: Text("Register",
                              style: GoogleFonts.breeSerif(
                                  fontSize: 18.0, color: Colors.white)),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}
