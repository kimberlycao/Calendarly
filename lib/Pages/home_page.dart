import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendarly/Pages/add_event_page.dart';
import 'package:calendarly/Widgets/calendar.dart';
import 'package:calendarly/Firebase/auth.dart';
import 'package:calendarly/Pages/login_page.dart';

class HomePage extends StatefulWidget {
  // final String uid;
  // HomePage({Key key, @required this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final String uid;
  _HomePageState();
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Calendarly",
                            style: GoogleFonts.breeSerif(fontSize: 30.0)),
                        Row(
                          children: [
                            SizedBox(
                              height: 35.0,
                              width: 35.0,
                              child: FloatingActionButton(
                                backgroundColor: Colors.blue[600],
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddEvent()));
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: () {
                                signOut().whenComplete(() =>
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                        (Route<dynamic> route) => false));
                              },
                              disabledColor: Colors.blue,
                              child: Text("Sign Out",
                                  style: GoogleFonts.breeSerif(
                                      fontSize: 15.0, color: Colors.white)),
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Calendar(controller: _controller),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.only(left: 30.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.blue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    Text("Tasks for Today:",
                        style: GoogleFonts.breeSerif(
                            color: Colors.white, fontSize: 20.0))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
