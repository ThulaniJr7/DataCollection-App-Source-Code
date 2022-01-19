import 'package:flutter/material.dart';

class HomeSalesAgent extends StatefulWidget {

  @override
  _HomeSalesAgentState createState() => _HomeSalesAgentState();
}

class _HomeSalesAgentState extends State<HomeSalesAgent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),

            // This is the editor for the Logo image at the top of the page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", width: 150, height: 150,),
              ],
            ),



          ],
        ),
      ),

    );
  }
}
