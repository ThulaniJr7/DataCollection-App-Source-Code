import 'package:flutter/material.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import 'package:tdmecommerce/screens/reghhcustomer.dart';
import 'package:tdmecommerce/screens/reghhspaza.dart';
import 'package:tdmecommerce/screens/reghhstokvel.dart';
import '../widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../commons.dart';

class RegHousehold extends StatefulWidget {
  @override
  _RegHouseholdState createState() => _RegHouseholdState();
}

class _RegHouseholdState extends State<RegHousehold> {
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

            // This is the editor for the Hyperlink Button to the Customer Page
            GestureDetector(
              onTap: (){
                changeScreen(context, RegCustomer());
              },

              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: orange),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(text: "Customer Registration", size: 20,),
                    ],
                  ),),
              ),
            ),

            SizedBox(height: 25),

            // This is the editor for the Hyperlink Button to the Spaza Page
            GestureDetector(
              onTap: (){
                changeScreen(context, RegSpaza());
              },

              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: orange),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(text: "Spaza Shop Registration", size: 20,),
                    ],
                  ),),
              ),
            ),

            SizedBox(height: 25),

            // This is the editor for the Hyperlink Button to the Stokvel Page
            GestureDetector(
              onTap: (){
                changeScreen(context, RegStokvel());
              },

              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: orange),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(text: "Stokvel Registration", size: 20,),
                    ],
                  ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
