import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key key,
    @required CalendarController controller,
  })  : _controller = controller,
        super(key: key);

  final CalendarController _controller;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        initialCalendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(
          todayColor: Colors.blue[400],
          selectedColor: Colors.blue[600],
          weekendStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
        ),
        headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonShowsNext: false,
            formatButtonTextStyle: GoogleFonts.breeSerif(color: Colors.white),
            formatButtonDecoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(30.0)),
            titleTextStyle:
                GoogleFonts.breeSerif(fontSize: 20.0, color: Colors.black)),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: GoogleFonts.breeSerif(fontWeight: FontWeight.bold),
            weekendStyle: GoogleFonts.breeSerif(
                fontWeight: FontWeight.bold, color: Colors.black)),
        calendarController: _controller);
  }
}
