import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:tdmecommerce/components/custom_surfix_icon.dart';
import 'package:tdmecommerce/components/default_button.dart';
import 'package:tdmecommerce/components/form_error.dart';
import 'package:tdmecommerce/screens/sign_in/sign_in_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../firebase.dart';

class registrationNPO extends StatefulWidget {
  @override
  _registrationNPOState createState() => _registrationNPOState();
}

class _registrationNPOState extends State<registrationNPO> {

  final _formKey = GlobalKey<FormState>();
  String email, password, conform_password, name, type, surname, phoneNumber, bizAdd1, bizAdd2, township, postalCode, serviceDesc, value;
  final String userRole = "NPO";
  String types = "NPO";
  bool remember = false;
  final List<String> errors = [];
  final List<String> items = [
    "Faith-Based Organisations (FBO)", "Non-Profit Company (NPC)",
    "Community-Based Organisations (CBO)", "Public Benefit Organisation (PBO)"
  ];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // This is the editor for the Logo image at the top of the page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/BlackandOrangeTDM1.png", width: 150, height: 150,),
                    ],
                  ),

                  // SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  Text("Register As A NPO", style: headingStyle, textAlign: TextAlign.center,),
                  // Text(
                  //   "Please Fill In Your Details",
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildNameField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        Container(
                          // width: 400,
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("NPO Type"),
                              value: value,
                              iconSize: 36,
                                icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                              isExpanded: true,
                              items: items.map(buildMenuItem).toList(),
                                onChanged: (value) => setState(() => this.value = value),
                            ),
                        ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildPhoneNumField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildBusinessAddress1Field(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildBusinessAddress2Field(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildTownshipField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildPostalCodeField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildDescriptionField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildEmailFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildPasswordFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildConformPassFormField(),
                        FormError(errors: errors),
                        SizedBox(height: getProportionateScreenHeight(40)),
                        DefaultButton(
                          text: "Continue",

                          press: () async {

                            CollectionReference users = FirebaseFirestore.instance.collection("npo_registration");
                            FirebaseAuth auth = FirebaseAuth.instance;

                            try
                            {

                              if(password == conform_password)
                              {

                                if(password.length > 7 && conform_password.length > 7)
                                {

                                  if(name != null && value != null && phoneNumber != null && township != null && postalCode != null && bizAdd1 != null && bizAdd2 != null && township != null && postalCode != null && serviceDesc != null)
                                  {

                                    UserCredential currentUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: email,
                                        password: conform_password
                                    );

                                    User updateUser = FirebaseAuth.instance.currentUser;
                                    userNPOSetup(name, value, phoneNumber, bizAdd1, bizAdd2, township, postalCode, serviceDesc, userRole, email, conform_password);

                                  }
                                  else
                                  {
                                    Fluttertoast.showToast(
                                      msg: "Please complete all the fields!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 18,
                                    );
                                  }

                                }
                              }
                              else
                              {
                                Fluttertoast.showToast(
                                  msg: "The Passwords entered don't match!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                );
                              }

                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();

                                Fluttertoast.showToast(
                                  msg: "Registration Successfully Captured!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                );

                                sendRegEmail(name: name, password: password, types: types, email: email );
                                Navigator.pushNamed(context, SignInScreen.routeName);
                              }

                            }
                            on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password'){
                                Fluttertoast.showToast(
                                  msg: "The password provided is too weak!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                );
                                // print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {

                                Fluttertoast.showToast(
                                  msg: "The account already exists for that email!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                );
                                // print('The account already exists for that email.');
                              }
                              // print(e.toString());
                            }

                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),

                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future sendRegEmail({name, password, types, email}) async {
    final service_id = "service_fktl86m";
    final template_id = "template_5v9bjuk";
    final user_id = "user_BoXVNfHkfcOalH8tZFNvs";
    var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await post(url, headers:
    {
      'origin': "http://localhost",
      'Content-Type': "application/json"
    },
        body: jsonEncode({
          'service_id': service_id,
          'template_id': template_id,
          'user_id': user_id,
          'template_params': {
            'name': name,
            'password': password,
            'types': types,
            'email': email,
          }

        }));

  }

  // NPO Name Input Field
  TextFormField buildNameField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        name = value;
        return name;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidBusinessNameError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "NPO Name",
        hintText: "Enter NPO Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  //This is the Dropdown Menu
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
  child: Text(
    item,
    style: TextStyle(fontSize: 14, color: Colors.black),
  ),
  );

  // Surname Input Field
  TextFormField buildSurnameField() {
    return TextFormField(
      onSaved: (newValue) => surname = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        surname = value;
        return surname;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Surname",
        hintText: "Enter Surname",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  // Phone Number Input Field
  TextFormField buildPhoneNumField() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        phoneNumber = value;
        return phoneNumber;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter Phone Number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  // Address 1 Input Field
  TextFormField buildBusinessAddress1Field() {
    return TextFormField(
      onSaved: (newValue) => bizAdd1 = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        bizAdd1 = value;
        return bizAdd1;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address Line 1",
        hintText: "Enter Address Line 1",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  // Address 2 Input Field
  TextFormField buildBusinessAddress2Field() {
    return TextFormField(
      onSaved: (newValue) => bizAdd2 = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        bizAdd2 = value;
        return bizAdd2;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address Line 2",
        hintText: "Enter Address Line 2",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  // Township Input Field
  TextFormField buildTownshipField() {
    return TextFormField(
      onSaved: (newValue) => township = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        township = value;
        return township;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Township",
        hintText: "Enter Your Township",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  // Postal Code Input Field
  TextFormField buildPostalCodeField() {
    return TextFormField(
      onSaved: (newValue) => postalCode = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        postalCode = value;
        return postalCode;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Postal Code",
        hintText: "Enter Postal Code",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Search Icon.svg"),
      ),
    );
  }

  // Service Description Input Field
  TextFormField buildDescriptionField() {
    return TextFormField(
      onSaved: (newValue) => serviceDesc = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        serviceDesc = value;
        return serviceDesc;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "NPO Description",
        hintText: "Enter Brief NPO Description",
        border: OutlineInputBorder(
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
      maxLines: 7,
    );
  }

  // Confirm Password Input Field
  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
        return conform_password;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-Enter Your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  // Password Input Field
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return password;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  // Email Input Field
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
        return email;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

}
