import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

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
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[50],
        centerTitle: true,
        title: Text('Calendarly',
            style: GoogleFonts.alatsi(fontSize: 20.0, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.orange[200],
                  selectedColor: Colors.orange[400],
                ),
                headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(30.0)),
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                calendarController: _controller)
          ],
        ),
      ),
    );
  }
}
