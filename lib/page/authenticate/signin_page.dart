import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instApp/page/wrapper.dart';
import 'package:instApp/services/auth.dart';

class SignInPage extends StatefulWidget {
  final Function toogleViewParam;
  SignInPage({this.toogleViewParam});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    height: screenSize.height * .45,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff2193b0), Color(0xff6dd5ed)])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.enhanced_encryption,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
                Container(
                  height: screenSize.height * .55,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenSize.height * .33,
                  left: 25,
                  right: 25,
                  bottom: screenSize.height * .27),
              child: Stack(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 30,
                        right: 30,
                        bottom: 70,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Username",
                                suffixIcon: Icon(Icons.person_outline),
                              ),
                              validator: (value) =>
                                  value.isEmpty ? "Masukkan E-Mail" : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: Icon(Icons.lock_outline)),
                              obscureText: true,
                              validator: (value) => value.length < 6
                                  ? "Password minimal 6 karakter"
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 4.0,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .60,
                  ),
                  Container(
                    width: screenSize.width * .68,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(0xff2193b0),
                        Color(0xff6dd5ed),
                      ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(2, 5))
                      ],
                    ),
                    child: ButtonTheme(
                      minWidth: screenSize.width * .60,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailPassword(email, password);
                            if (result == null) {
                              setState(() => error =
                                  "Tidak dapat login, periksa E-Mail dan Password");
                            } else {
                              Navigator.pop(context);
                              return Wrapper();
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Belum punya akun ?",
                            style:
                                TextStyle(color: Colors.black, fontSize: 10)),
                        TextSpan(
                            text: "  Create Now",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.toogleViewParam();
                              }),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
