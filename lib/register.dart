import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:email_validator/email_validator.dart';

class RegisterWithEmail extends StatefulWidget {
  @override
  _RegisterWithEmailState createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
  String email;
  String password;
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
              Text("Register with Email",
                  style: GoogleFonts.breeSerif(fontSize: 30.0)),
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
              TextFormField(
                obscureText: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: "This Field Is Required."),
                  MinLengthValidator(8,
                      errorText: "Password must be 8 characters in length!")
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
                    onPressed: null,
                    disabledColor: Colors.blue, //remove afterwards
                    child: Text("Register",
                        style: GoogleFonts.breeSerif(
                            fontSize: 18.0, color: Colors.white)),
                    color: Colors.blue,
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
