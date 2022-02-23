import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tdmecommerce/components/custom_surfix_icon.dart';
import 'package:tdmecommerce/components/default_button.dart';
import 'package:tdmecommerce/components/form_error.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import 'package:tdmecommerce/screens/home/home_screen.dart';
import 'package:tdmecommerce/screens/registrations/firebase.dart';
import 'package:tdmecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:http/http.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class advertisingService extends StatefulWidget {

  @override
  _advertisingServiceState createState() => _advertisingServiceState();
}

class _advertisingServiceState extends State<advertisingService> {

  final _formKey = GlobalKey<FormState>();
  String email, name, surname, phoneNumber, amount, serviceDesc;
  String types = "Advertising";
  bool remember = false;
  final List<String> errors = [];

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
                  Text("Advertising Services", style: headingStyle, textAlign: TextAlign.center,),
                  Text(
                    "Please fill in all your details to apply for Advertising assistance",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                          Form(
                      key: _formKey,
                      child: Column(
                          children: [
                      buildNameField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildSurnameField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildEmailFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildPhoneNumField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildDescriptionField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      DefaultButton(
                        text: "Apply",

                        press: () async {

                          // User updateUser = FirebaseAuth.instance.currentUser;
                          userAdvertisingServiceHome(name, surname, phoneNumber, serviceDesc, email);

                          Fluttertoast.showToast(
                                    msg: "Application Message Sent",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 18,
                                  );

                          sendEmail(name: name, surname: surname, phoneNumber: phoneNumber, serviceDesc: serviceDesc, types: types, email: email );
                          Navigator.pushNamed(context, HomeScreen.routeName);

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

  Future sendEmail({name, surname, phoneNumber, serviceDesc, types, email}) async {
    final service_id = "service_fktl86m";
    final template_id = "template_wudzst9";
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
            'first_name': name,
            'surname': surname,
            'contact_number': phoneNumber,
            'description': serviceDesc,
            'type': types,
            'email': email,
          }

        }));

  }

  // Name Input Field
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
        labelText: "Name",
        hintText: "Enter First Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

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
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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

  // Amount Input Field
  TextFormField buildAmountField() {
    return TextFormField(
      onSaved: (newValue) => amount = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        amount = value;
        return amount;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kInvalidInputError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Amount",
        hintText: "Enter Amount Required",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Cash.svg"),
      ),
    );
  }

  // Advertising Description Input Field
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
        labelText: "Advertising Description",
        hintText: "Enter Reason for Advertising Assistance",
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
