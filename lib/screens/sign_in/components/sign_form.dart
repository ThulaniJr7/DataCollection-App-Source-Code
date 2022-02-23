import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tdmecommerce/components/custom_surfix_icon.dart';
import 'package:tdmecommerce/components/form_error.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';
import 'package:tdmecommerce/screens/dc_page/body.dart';
import 'package:tdmecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:tdmecommerce/screens/generals_page/body.dart';
import 'package:tdmecommerce/screens/home/home_screen.dart';
import 'package:tdmecommerce/screens/home_dc/components/body.dart';
import 'package:tdmecommerce/screens/home_dc/home_screen.dart';
import 'package:tdmecommerce/screens/home_general/home_screen.dart';
import 'package:tdmecommerce/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool remember = false;
  final List<String> errors = [];
  final _auth = FirebaseAuth.instance;

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
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              // This code is for the "Remember Me" check box
              // Checkbox(
              //   value: remember,
              //   activeColor: kPrimaryColor,
              //   onChanged: (value) {
              //     setState(() {
              //       remember = value;
              //     });
              //   },
              // ),
              // Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {

                signIn(emailController.text, passwordController.text);

            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // DefaultButton(
          //   text: "DC Home Page",
          //
          //   press: () async {
          //
          //     Navigator.pushNamed(context, HomeScreenDC.routeName);
          //     // changeScreen(context, BodyDC());
          //
          //   },
          // ),
          // SizedBox(height: getProportionateScreenHeight(20)),
          // DefaultButton(
          //   text: "General Service Home Page",
          //
          //   press: () async {
          //
          //     Navigator.pushNamed(context, HomeScreenGen.routeName);
          //
          //   },
          // ),
          // SizedBox(height: getProportionateScreenHeight(20)),
          // DefaultButton(
          //   text: "Manufacturer Home Page",
          //
          //   press: () async {
          //
          //     // Navigator.pushNamed(context, HomeScreenMan.routeName);
          //
          //   },
          // ),
          // SizedBox(height: getProportionateScreenHeight(20)),
          // DefaultButton(
          //   text: "Sales Agent Home Page",
          //
          //   press: () async {
          //
          //     // Navigator.pushNamed(context, HomeScreenSA.routeName);
          //
          //   },
          // ),
          // SizedBox(height: getProportionateScreenHeight(20)),
          // SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }

  void signIn(String email, String password) async {

    try
    {

      // This is the validation form of the login credentials that still need to be configured
      if (_formKey.currentState.validate()) {
        // _formKey.currentState.save();
        // if all are valid then go to success screen

        await _auth.signInWithEmailAndPassword(email: email, password: password)
            .then((uid) =>
        {

          Navigator.pushNamed(context, LoginSuccessScreen.routeName),
        });

      }

    }
    catch (e)
    {
      if (e.code == 'invalid-email'){

        Fluttertoast.showToast(
          msg: "You Have Entered An Invalid Email Address!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18,
        );
      }
      else if (e.code == 'user-not-found') {

        Fluttertoast.showToast(
          msg: "There Is No User Associated To The Email Entered!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18,
        );
      }
      else if (e.code == 'wrong-password') {

        Fluttertoast.showToast(
          msg: "You Have Entered The Wrong Password!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18,
        );
      }
      else {
        Fluttertoast.showToast(
          msg: "An Error Occurred!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18,
        );
      }
    }

  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        // return null;
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onSaved: (value) {
        emailController.text = value;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },

      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        // return null;
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
