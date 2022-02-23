// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Code below is related to the methods used to add a users registration details into the firestore collection

Future<void> userGenProvSetup(String name, String surname, String value, String phoneNumber, String bizAdd1, String bizAdd2, String township, String postalCode,
    String serviceDesc, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('service_provider_registration');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'surname' : surname,
    'type' : value,
    'phone_number' : phoneNumber,
    'address_line_1' : bizAdd1,
    'address_line_2' : bizAdd2,
    'township' : township,
    'postal_code' : postalCode,
    'service_description' : serviceDesc,
    'user_role' : userRole,
    'email' : email,
    'password' : conform_password
    // 'uid' : uid
  });
  return;
}

Future<void> userDistroCentSetup(String businessName, String value, String bizAdd1, String bizAdd2, String township, String postalCode,
    String companyRegNum, String contactPerson, String contactPersonPosition, String contactPersonNumber, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('distro_registration');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'business_name': businessName,
    'type' : value,
    'business_address_line_1' : bizAdd1,
    'business_address_line_2' : bizAdd2,
    'township' : township,
    'postal_code' : postalCode,
    'company_reg' : companyRegNum,
    'contact_person' : contactPerson,
    'position' : contactPersonPosition,
    'contact_no' : contactPersonNumber,
    'user_role' : userRole,
    'email' : email,
    'password' : conform_password
    // 'uid' : uid

  });
  return;
}

Future<void> userSalesAgentSetup(String name, String surname, String phoneNumber, String bizAdd1, String bizAdd2, String township,
    String postalCode, String age, String idNum, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('sales_agent_registration');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'surname' : surname,
    'phone_number' : phoneNumber,
    'address_line_1' : bizAdd1,
    'address_line_1' : bizAdd2,
    'township' : township,
    'postal_code' : postalCode,
    'age' : age,
    'id_number' : idNum,
    'user_role' : userRole,
    'email' : email,
    'password' : conform_password
    // 'uid' : uid
  });
  return;
}

Future<void> userManufacSetup(String businessName, String value, String bizAdd1, String bizAdd2, String township, String postalCode,
    String companyRegNum, String contactPerson, String contactPersonPosition, String contactPersonNumber, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('manufacturer_registration');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'business_name': businessName,
    'type' : value,
    'business_address_line_1' : bizAdd1,
    'business_address_line_2' : bizAdd2,
    'township' : township,
    'postal_code' : postalCode,
    'company_reg' : companyRegNum,
    'contact_person' : contactPerson,
    'position' : contactPersonPosition,
    'contact_no' : contactPersonNumber,
    'user_role' : userRole,
    'email' : email,
    'password' : conform_password,
    'uid' : uid

  });
}

Future<void> userNPOSetup(String name, String value, String phoneNumber, String bizAdd1, String bizAdd2, String township, String postalCode,
    String serviceDesc, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('npo_registration');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'type' : value,
    'phone_number' : phoneNumber,
    'address_line_1' : bizAdd1,
    'address_line_2' : bizAdd2,
    'township' : township,
    'postal_code' : postalCode,
    'service_description' : serviceDesc,
    'user_role' : userRole,
    'email' : email,
    'password' : conform_password
    // 'uid' : uid
  });
  return;
}

// Code below is related to the methods used to add a users application into the firestore collection

Future<void> userFinanceServiceHome(String name, String surname, String phoneNumber, String amount, String serviceDesc, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('finance_application_home');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'surname' : surname,
    'email' : email,
    'phone_number' : phoneNumber,
    'amount' : amount,
    'service_description' : serviceDesc
    // 'uid' : uid
  });
  return;
}

Future<void> userMarketingServiceHome(String name, String surname, String phoneNumber, String serviceDesc, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('marketing_application_home');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'surname' : surname,
    'email' : email,
    'phone_number' : phoneNumber,
    'service_description' : serviceDesc
    // 'uid' : uid
  });
  return;
}

Future<void> userAdvertisingServiceHome(String name, String surname, String phoneNumber, String serviceDesc, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('advertising_application_home');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'surname' : surname,
    'email' : email,
    'phone_number' : phoneNumber,
    'service_description' : serviceDesc
    // 'uid' : uid
  });
  return;
}

Future<void> userGraphicDesignServiceHome(String name, String surname, String phoneNumber, String time, String serviceDesc, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('graphic_design_application_home');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'name': name,
    'surname' : surname,
    'email' : email,
    'phone_number' : phoneNumber,
    'time_limit' : time,
    'service_description' : serviceDesc
    // 'uid' : uid
  });
  return;
}