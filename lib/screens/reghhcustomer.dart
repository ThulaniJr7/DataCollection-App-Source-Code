import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tdmecommerce/screens/homescreen.dart';
import 'package:tdmecommerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import '../widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../commons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegCustomer extends StatefulWidget {
  @override
  _RegCustomerState createState() => _RegCustomerState();
}

class _RegCustomerState extends State<RegCustomer> {

  String valueChoose;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController altnumController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController ageHeadOfHouseController = TextEditingController();
  TextEditingController numFamilyMembersController = TextEditingController();

  List listItem = [
    "Mudzi", "Beyond 360", "Mudzi Soweto"
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

                // This is the editor for the input form for the Name Of Consumer
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name Of Consumer",
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

                // This is the editor for the input form for the Address Line 1
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: address1Controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address Line 1",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Address Line 2
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: address2Controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address Line 2",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the City/Township
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: cityController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "City/Township",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Postal Code
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: postalCodeController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Postal Code",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Phone Number
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: phoneNumController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Alternative Number
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: altnumController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Alternative Number",
                            icon: Icon(Icons.phone)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Occupation
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: occupationController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Occupation",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Head Of Household Age
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: ageHeadOfHouseController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Head Of Household Age",
                            icon: Icon(Icons.person)
                        ),
                      ),
                    ),
                  ),
                ),

                // This is the editor for the input form for the Number Of Family Members
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: numFamilyMembersController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Number Of Family Members",
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

                SizedBox(height: 10),

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
                        final String name = nameController.text.trim();
                        final String city = cityController.text.trim();
                        final String postalCode = postalCodeController.text.trim();
                        final String address1 = address1Controller.text.trim();
                        final String address2 = address2Controller.text.trim();
                        final String phoneNum = phoneNumController.text.trim();
                        final String altNum = altnumController.text.trim();
                        final String occupation = occupationController.text.trim();
                        final String ageHeadOfHouse = ageHeadOfHouseController.text.trim();
                        final String numFamilyMembers = numFamilyMembersController.text.trim();

                        if (email.isEmpty) {
                          print("Email is Empty");
                        } else {
                          if (password.isEmpty) {
                            print("Password is Empty");
                          }
                          else {
                            context.read<AuthService>().userRegistrationCustomer(
                              email, password,
                            ).then((value) async {
                              User user = FirebaseAuth.instance.currentUser;

                              await FirebaseFirestore.instance.collection(
                                  "customerRegUser").doc(user.uid).set({
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
