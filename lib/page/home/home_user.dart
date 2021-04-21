import 'package:flutter/material.dart';
import 'package:instApp/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home"),
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.all_out),
            label: Text("Logout"),
            onPressed: () {
              return _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
