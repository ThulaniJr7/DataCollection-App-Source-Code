// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserSimplePreferences {
//
//   static SharedPreferences _preferences;
//
// // These are all the fields required to register a Sales Agent
//   static const _keyEmail = '';
//   static const _keyPassword = '';
//   static const _keyName = '';
//   static const _keySurname = '';
//   static const _keyAddress1 = '';
//   static const _keyAddress2 = '';
//   static const _keyTownship = '';
//   static const _keyPostalCode = '';
//   static const _keyPhoneNum = '';
//   static const _keyAge = '';
//   static const _keyId = '';
//   // static const _keyEmail = '';
//
// // This is what you use when calling the SharedPreferences method
//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();
//
// // This is the method used to set the email into SharedPreferences
//   static Future setEmail(String email) async =>
//       await _preferences.setString(_keyEmail, email);
//
// // This is the method used to get the email from SharedPreferences
// static Future getEmail() => _preferences.getString(_keyEmail);
//
//
// }
