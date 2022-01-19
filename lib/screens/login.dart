import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import 'package:tdmecommerce/screens/homesalesagent.dart';
import 'package:tdmecommerce/screens/homescreen.dart';
import 'package:tdmecommerce/services/auth_services.dart';
import 'package:tdmecommerce/widgets/custom_text.dart';

import '../commons.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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

            // This is the editor for the input form for the Email Address
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email Address",
                        icon: Icon(Icons.email)
                    ),
                  ),
                ),
              ),
            ),

            // This is the editor for the input form for the Password
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock)
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),

            // Still need to add the authentication of the user to establish who is the individual logging in direct them
            // to the correct page

            // This is the editor for the Login Button on the page
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    border: Border.all(color: orange),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: FlatButton(
                  onPressed: () {

                    changeScreen(context, HomeSalesAgent());

                    final String email = emailController.text.trim();
                    final String password = passwordController.text.trim();

                    // if (email.isEmpty) {
                    //   print("Email is Empty");
                    // } else {
                    //   if (password.isEmpty) {
                    //     print("Password is Empty");
                    //   }
                    //   else {
                    //     context.read<AuthService>().login(
                    //       email, password,
                    //     ).then((value) async {
                    //       User user = FirebaseAuth.instance.currentUser;
                    //
                    //       // await FirebaseFirestore.instance.collection(
                    //       //     "distroCenterRegUser").doc(user.uid).set({
                    //       //   'uid': user.uid,
                    //       //   'email': email,
                    //       //   'password': password,
                    //       // });
                    //     });
                    //
                    //     // changeScreen(context, HomeScreen());
                    //   }
                    // }

                  },
                  child: Center(
                    child: Text("Login", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
