import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'add_event.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;
  AnimationController _animation;
  int currentYear;
  Map<DateTime, String> specialDates;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    //set current year
    var currentYear = DateTime.now().year;

    specialDates = {
      DateTime(currentYear, 1, 1): "New Years",
      DateTime(currentYear, 10, 10): "Naruto Uzamaki's Birthday",
      DateTime(currentYear, 7, 23): "Sasuke Uchiha's Birthday",
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    _animation.dispose();
    super.dispose();
  }

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
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Calendarly",
                            style: GoogleFonts.breeSerif(fontSize: 30.0)),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddEvent()));
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TableCalendar(
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.blue[400],
                    selectedColor: Colors.blue[600],
                    weekendStyle:
                        TextStyle(color: Colors.black.withOpacity(0.3)),
                  ),
                  headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonShowsNext: false,
                      formatButtonTextStyle:
                          GoogleFonts.breeSerif(color: Colors.white),
                      formatButtonDecoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(30.0)),
                      titleTextStyle: GoogleFonts.breeSerif(
                          fontSize: 20.0, color: Colors.black)),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle:
                          GoogleFonts.breeSerif(fontWeight: FontWeight.bold),
                      weekendStyle: GoogleFonts.breeSerif(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  calendarController: _controller),
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
