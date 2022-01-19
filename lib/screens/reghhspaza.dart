import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tdmecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../widgets/custom_text.dart';

import '../commons.dart';

class RegSpaza extends StatefulWidget {
  @override
  _RegSpazaState createState() => _RegSpazaState();
}

class _RegSpazaState extends State<RegSpaza> {

  TextEditingController businessNameController = new TextEditingController();
  TextEditingController contactPersonController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController businessAddController = new TextEditingController();
  TextEditingController contactNumController = new TextEditingController();
  TextEditingController contactPersonPosController = new TextEditingController();
  TextEditingController companyRegController = new TextEditingController();

  String valueChoose;
  List listItem = [
    "Skin Care", "Hair Care", "Hygiene Care",
    "Pharmaceutical", "Grocery", "Detergents"
  ];

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

                // This is the editor for the input form for the name of business
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: businessNameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name Of Business",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Business Address
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: businessAddController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Business Address",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
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

                // This is the editor for the input form for the Contact Person
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: contactPersonController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Contact Person",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Contact Number
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: contactNumController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Contact Number",
                            icon: Icon(Icons.phone)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Position Of Contact Person
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: contactPersonPosController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Position Of Contact Person",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Company Registration
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: companyRegController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Company Registration",
                            icon: Icon(Icons.phone)
                        ),
                      ),
                    ),
                  ),
                ),

                //  This is the editor for the dropdown list
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: grey, width: 1),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: DropdownButton(
                      hint: Text("Choose From List"),
                      dropdownColor: white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                //  This is the editor for the Register button
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

                        final String email = emailController.text.trim();
                        final String password = passwordController.text.trim();
                        final String name = businessNameController.text.trim();
                        final String contactPerson = contactPersonController.text.trim();
                        final String contactNumber = contactNumController.text.trim();
                        final String businessAddress = businessAddController.text.trim();
                        final String companyReg = companyRegController.text.trim();
                        final String contactPersonPosition = contactPersonPosController.text.trim();

                        if (email.isEmpty) {
                          print("Email is Empty");
                        } else {
                          if (password.isEmpty) {
                            print("Password is Empty");
                          }
                          else {
                            context.read<AuthService>().userRegistrationSpaza(
                              email, password,
                            ).then((value) async {
                              User user = FirebaseAuth.instance.currentUser;

                              await FirebaseFirestore.instance.collection(
                                  "spazaRegUser").doc(user.uid).set({
                                'uid': user.uid,
                                'email': email,
                                'password': password,
                              });
                            });
                          }
                        }

                      },
                      child: Center(
                        child: Text("Register", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ),

              ],
            )
        )
    );
  }
}
