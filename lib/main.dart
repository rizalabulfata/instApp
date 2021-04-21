import 'package:flutter/material.dart';
import 'package:instApp/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:kereta_sumenep_app/page/welcomepage_body.dart';
import 'package:instApp/page/wrapper.dart';
import 'package:instApp/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Widget dasar dari aplikasi
  @override
  Widget build(BuildContext context) {
    return StreamProvider<PriveUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
