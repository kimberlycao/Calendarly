import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  DateTime _taskDate;
  TimeOfDay _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.0),
            Text("Add New Task", style: GoogleFonts.breeSerif(fontSize: 30.0)),
            SizedBox(height: 25.0),
            TextFormField(
              validator: (val) {
                if (val.length == 0) {
                  return "Title cannot be empty";
                } else {
                  return null;
                }
              },
              style: GoogleFonts.breeSerif(fontSize: 18.0),
              decoration: InputDecoration(
                  labelText: "Title",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(height: 25.0),
            Card(
                child: ListTile(
              title: Text("Task Date",
                  style: GoogleFonts.breeSerif(fontSize: 18.0)),
              leading: Icon(Icons.calendar_today),
            )),
            SizedBox(height: 25.0),
            TextFormField(
              style: GoogleFonts.breeSerif(fontSize: 18.0),
              decoration: InputDecoration(
                  labelText: "Notes",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            SizedBox(height: 50),
            Center(
              child: ButtonTheme(
                minWidth: 300.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: null,
                  disabledColor: Colors.blue, //remove afterwards
                  child: Text("Save",
                      style: GoogleFonts.breeSerif(
                          fontSize: 18.0, color: Colors.white)),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
