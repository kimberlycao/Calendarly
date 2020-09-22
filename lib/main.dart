import 'package:calendarly/homepage.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'add_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register_page.dart';

//import 'package:intl/date_symbol_data_local.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //initializeDateFormatting().then((_) => runApp(MyApp()));
  runApp(MyApp());
}

MaterialColor colorCustom = MaterialColor(0xFF0d8cd6, color);
Map<int, Color> color = {
  50: Color.fromRGBO(13, 140, 214, .1),
  100: Color.fromRGBO(13, 140, 214, .2),
  200: Color.fromRGBO(13, 140, 214, .3),
  300: Color.fromRGBO(13, 140, 214, .4),
  400: Color.fromRGBO(13, 140, 214, .5),
  500: Color.fromRGBO(13, 140, 214, .6),
  600: Color.fromRGBO(13, 140, 214, .7),
  700: Color.fromRGBO(13, 140, 214, .8),
  800: Color.fromRGBO(13, 140, 214, .9),
  900: Color.fromRGBO(13, 140, 214, 1),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: HomePage());
        home: LoginScreen());
    //home: AddEvent());
    //home: RegisterWithEmail());
  }
}
