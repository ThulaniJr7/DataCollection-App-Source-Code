import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userGenProvSetup(String name, String surname, String phoneNumber, String bizAdd1, String bizAdd2, String township, String postalCode,
    String serviceDesc, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('generalServRegUser');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'Name': name,
    'Surname' : surname,
    'PhoneNumber' : phoneNumber,
    'BusinessAddressLine1' : bizAdd1,
    'BusinessAddressLine2' : bizAdd2,
    'Township' : township,
    'PostalCode' : postalCode,
    'Description' : serviceDesc,
    'UserRole' : userRole,
    'Email' : email,
    'Password' : conform_password,
    'uid' : uid
  });
  return;
}

Future<void> userDistroCentSetup(String businessName, String bizAdd1, String bizAdd2, String township, String postalCode,
    String companyRegNum, String contactPerson, String contactPersonPosition, String contactPersonNumber, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('distroCenterRegUser');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'BusinessName': businessName,
    'BusinessAddressLine1' : bizAdd1,
    'BusinessAddressLine2' : bizAdd2,
    'Township' : township,
    'PostalCode' : postalCode,
    'CompanyRegNo' : companyRegNum,
    'ContactPerson' : contactPerson,
    'ContactPersonPos' : contactPersonPosition,
    'ContactPersonNumber' : contactPersonNumber,
    'UserRole' : userRole,
    'Email' : email,
    'Password' : conform_password,
    'uid' : uid

  });
  return;
}

Future<void> userSalesAgentSetup(String name, String surname, String phoneNumber, String bizAdd1, String bizAdd2, String township,
    String postalCode, String age, String idNum, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('salesAgentRegUser');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'Name': name,
    'Surname' : surname,
    'PhoneNumber' : phoneNumber,
    'BusinessAddressLine1' : bizAdd1,
    'BusinessAddressLine2' : bizAdd2,
    'Township' : township,
    'PostalCode' : postalCode,
    'Age' : age,
    'IDNumber' : idNum,
    'UserRole' : userRole,
    'Email' : email,
    'Password' : conform_password,
    'uid' : uid
  });
  return;
}

Future<void> userManufacSetup(String businessName, String bizAdd1, String bizAdd2, String township, String postalCode,
    String companyRegNum, String contactPerson, String contactPersonPosition, String contactPersonNumber, String userRole, String email, String conform_password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('manufactureRegUser');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'BusinessName': businessName,
    'BusinessAddressLine1' : bizAdd1,
    'BusinessAddressLine2' : bizAdd2,
    'Township' : township,
    'PostalCode' : postalCode,
    'CompanyRegNo' : companyRegNum,
    'ContactPerson' : contactPerson,
    'ContactPersonPos' : contactPersonPosition,
    'ContactPersonNumber' : contactPersonNumber,
    'UserRole' : userRole,
    'Email' : email,
    'Password' : conform_password,
    'uid' : uid

  });
}
