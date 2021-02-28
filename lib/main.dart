import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saveury/pages/homePage.dart';
import 'package:saveury/pages/ingredientsPage.dart';
import 'package:saveury/pages/questionPage.dart';
import './screens/authScreen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color(0xFF3A539B),
        accentColor: Color(0xffec5451),


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
        'home': (context) => HomePage(),
        'questionPage' : (context) => QuestionPage(),
        'ingredientsPage' : (context) => IngredientsPage(),
        'auth' : (context) => AuthScreen(),
      },
      initialRoute: FirebaseAuth.instance.currentUser == null ? 'auth' : 'home',
    );
  }
}
