import 'package:flutter/material.dart';
import 'package:instApp/page/authenticate/authenticate.dart';
import 'package:instApp/page/authenticate/signin_page.dart';
import 'package:instApp/page/authenticate/signup_page.dart';

class WelcomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              height: screenSize.height * .60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Insta App",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "created by Rizal",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.all(4),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              // ),
              child: ButtonTheme(
                // minWidth: screenSize.width * .60,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Color(0xff2193b0),
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Authenticate()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
