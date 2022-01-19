import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import 'package:tdmecommerce/screens/registrations/distribution_center/dc_reg.dart';
import 'package:tdmecommerce/screens/registrations/general/general_reg.dart';
import 'package:tdmecommerce/screens/registrations/manufacturer/manufacturer_reg.dart';
import 'package:tdmecommerce/screens/registrations/sales_agent/agent_reg.dart';
import 'package:tdmecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:tdmecommerce/services/auth_services.dart';
import 'package:tdmecommerce/components/custom_surfix_icon.dart';
import 'package:tdmecommerce/components/default_button.dart';
import 'package:tdmecommerce/components/form_error.dart';
import 'package:tdmecommerce/screens/complete_profile/complete_profile_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;
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
    return Form(
      key: _formKey,
      child: Column(
        children: [

          // This should be the button to register a Manufacturer
          DefaultButton(
            text: "Manufacturer Registration",

            press: () async {

              changeScreen(context, registrationManufacturer());

              // try{
              //   UserCredential currentUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              //       email: email,
              //       password: conform_password);
              //
              // }
              // catch (e) {
              //   return e.toString();
              // }
              //
              // if (_formKey.currentState.validate()) {
              //   _formKey.currentState.save();
              //
              //   // if all are valid then go to success screen
              //   Navigator.pushNamed(context, SignInScreen.routeName);
              // }
            },
          ),

          SizedBox(height: getProportionateScreenHeight(30)),

          // This should be the button to register a Distribution Center
          DefaultButton(
            text: "Distribution Center Registration",

            press: () async {

              changeScreen(context, registrationDC());

            },

          ),

          SizedBox(height: getProportionateScreenHeight(30)),

          // This should be the button to register a Sales Agent
          DefaultButton(
            text: "Sales Agent Registration",

            press: () async {

              changeScreen(context, registrationSalesAgent());

            },
          ),

          SizedBox(height: getProportionateScreenHeight(30)),

          // This should be the button to register a General Service Provider
          DefaultButton(
            text: "General Provider Registration",

            press: () async {

              changeScreen(context, registrationGeneral());

            },
          ),

        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
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
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
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
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

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
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
