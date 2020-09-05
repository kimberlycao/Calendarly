import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';


void main() {
  runApp(MyApp());
}
MaterialColor colorCustom = MaterialColor(0xFFF6AD59, color);
Map<int, Color> color =
{
  50:Color.fromRGBO(246,173,89, .1),
  100:Color.fromRGBO(246,173,89, .2),
  200:Color.fromRGBO(246,173,89, .3),
  300:Color.fromRGBO(246,173,89, .4),
  400:Color.fromRGBO(246,173,89, .5),
  500:Color.fromRGBO(246,173,89, .6),
  600:Color.fromRGBO(246,173,89, .7),
  700:Color.fromRGBO(246,173,89, .8),
  800:Color.fromRGBO(246,173,89, .9),
  900:Color.fromRGBO(246,173,89, 1),
};
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tf is this',
      theme: ThemeData(
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendarly', style: GoogleFonts.alatsi(fontSize: 20.0, color: Colors.white)),
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
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )
                ),
                calendarController: _controller)
          ],
        ),
      ),
    );
  }
}