import 'package:flutter/material.dart';
import 'package:meau_app/view/testFirebase/Setup/signin.dart';
import 'package:meau_app/view/testFirebase/Setup/signup.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('Sign In'),
          ),
          RaisedButton(
            onPressed: navigateToSignUp,
            child: Text('Sign Up'),
          ),

        ],
      )
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));

  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),fullscreenDialog: true));
  }
}
