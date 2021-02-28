import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  bool accountExists;
  bool viewPassword;
  AuthForm({this.accountExists, this.viewPassword});
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRegistered = false;
  bool isObscure = true;
  final _auth = FirebaseAuth.instance;
  void snackBar() {}
  void submit() async {
    if (isRegistered) {
      final authRes = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print(authRes);
    } else {
      final authRes = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    }
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Done")));
    if(!isRegistered)
    Navigator.of(context).pushNamed("home");
    else
      Navigator.of(context).pushNamed("questionPage");

  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              topLeft: Radius.circular(60))),
      height: screenSize.height * 0.65,
      width: screenSize.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isRegistered ? "Welcome to Saveury" : "Welcome back to Saveury",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          isRegistered
              ? TextField(
                  decoration: InputDecoration(labelText: "Username"),
                  controller: usernameController,
                )
              : Container(),
          TextField(
            decoration: InputDecoration(labelText: "Email"),
            controller: emailController,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              TextField(
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                controller: passwordController,
              ),
              IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: !isObscure
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  })
            ],
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          FlatButton(
              onPressed: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Boxes shouldnt be left empty"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (!emailController.text.contains('@') ||
                    !emailController.text.contains('.com')) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Enter valid email id"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (passwordController.text.length <= 6) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Password/Username length must be longer"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  submit();
                }
              },
              child: Text(isRegistered ? "Register" : "Login")),
          FlatButton(
              onPressed: () {
                setState(() {
                  isRegistered = !isRegistered;
                });
              },
              child: Text(isRegistered
                  ? "Already a user??"
                  : "New to this app?? Register"))
        ],
      ),
    ));
  }
}
