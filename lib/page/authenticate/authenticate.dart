import 'package:flutter/material.dart';
import 'package:instApp/page/authenticate/signin_page.dart';
import 'package:instApp/page/authenticate/signup_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toogleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInPage(toogleViewParam: toogleView);
    } else {
      return SignUpPage(toogleViewParam: toogleView);
    }
  }
}
