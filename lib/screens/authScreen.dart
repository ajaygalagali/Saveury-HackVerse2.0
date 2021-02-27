import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/authForm.dart';
class AuthScreen extends StatelessWidget

{
  final authInstance = FirebaseAuth.instance;
  bool _viewPassword = false;
  bool _accountExists = false;
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child:AuthForm(accountExists: _accountExists,viewPassword: _viewPassword),
      ),
    );
  }
}