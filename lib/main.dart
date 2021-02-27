import 'package:flutter/material.dart';
import 'file:///C:/Users/gvaja/FlutterProjects/saveury/lib/pages/questionPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saveury',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: myApp(),
    );
  }
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color(0xFF3A539B),
        accentColor: Color(0xFF3A539B),

        // Define the default font family.
        // fontFamily: 'Robato',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      routes: {
        'home': (context) => QuestionPage(),
      },
      initialRoute: 'home',
    );
  }
}

