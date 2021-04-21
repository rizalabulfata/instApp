import 'package:flutter/material.dart';
import 'package:instApp/models/user.dart';
import 'package:instApp/page/authenticate/authenticate.dart';
import 'package:instApp/page/home/home_user.dart';
import 'package:instApp/page/welcomepage_body.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<PriveUser>(context);
    print(user);

    //return ke home jika login
    if (user == null) {
      return WelcomePageBody();
    } else {
      return Home();
    }
  }
}
