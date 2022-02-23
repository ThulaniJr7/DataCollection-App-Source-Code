import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tdmecommerce/screens/agent_page/components/body.dart';
import 'package:tdmecommerce/services/auth_services.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {

  String myName;
  // final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('sales_agent_registrations');

  // const DiscountBanner({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      // height: 90,

      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF36B24),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            // TextSpan(text: "Welcome,\n"),
            TextSpan(
              // Find out how to pull the users name & surname to reflect here
              text: "Welcome",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

  }

}
