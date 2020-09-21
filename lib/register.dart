import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWithEmail extends StatefulWidget {
  @override
  _RegisterWithEmailState createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {
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
                validator: (val) {
                  if (val.length == 0) {
                    return "Email cannot be empty";
                  } else {
                    return null;
                  }
                },
                style: GoogleFonts.breeSerif(fontSize: 18.0),
                decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
