import 'package:calendarly/calendar.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
//import 'package:intl/date_symbol_data_local.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() {
  //initializeDateFormatting().then((_) => runApp(MyApp()));
  runApp(MyApp());
}

MaterialColor colorCustom = MaterialColor(0xFF1C79E4, color);
Map<int, Color> color = {
  50: Color.fromRGBO(28, 121, 228, .1),
  100: Color.fromRGBO(28, 121, 228, .2),
  200: Color.fromRGBO(28, 121, 228, .3),
  300: Color.fromRGBO(28, 121, 228, .4),
  400: Color.fromRGBO(28, 121, 228, .5),
  500: Color.fromRGBO(28, 121, 228, .6),
  600: Color.fromRGBO(28, 121, 228, .7),
  700: Color.fromRGBO(28, 121, 228, .8),
  800: Color.fromRGBO(28, 121, 228, .9),
  900: Color.fromRGBO(28, 121, 228, 1),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: HomePage(),
      home: LoginScreen(),
    );
  }
}
