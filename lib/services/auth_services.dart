import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tdmecommerce/helpers/screen_navigation.dart';

class AuthService {

  final FirebaseAuth _auth;
  final CollectionReference profileList = FirebaseFirestore.instance.collection('sales_agent_registrations');
  AuthService(this._auth);
  Stream<User> get authStateChanges => _auth.idTokenChanges();

  // This is the command used to send the data to Firebase for login Registration
  Future<String> login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch(e) {
      return e;
    }
  }

  // This is the command used to send the data to Firebase for Sign Up Registration
  Future<String> signUp(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        User user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'password': password,
        });
      });
      return "Signed Up";
    } catch(e) {
      return e;
    }
  }

  // This is the command used to send the data to Firebase for Customer Registration
  Future<String> userRegistrationCustomer(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  // This is the command used to send the data to Firebase for General Services Registration
  Future<String> userRegistrationGeneral(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  //  This is the command used to send the data to Firebase for Stokvel Registration
  Future<String> userRegistrationStokvel(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  //  This is the command used to send the data to Firebase for Spaza Registration
  Future<String> userRegistrationSpaza(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  //  This is the command used to send the data to Firebase for Distribution Center Registration
  Future<String> userRegistrationDC(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  //  This is the command used to send the data to Firebase for Sales Agent Registration
  Future<String> userRegistrationSalesAgent(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  //  This is the command used to send the data to Firebase for Manufacturer Registration
  Future<String> userRegistrationMan(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e.toString();
    }
  }

  Future<String> generalServiceUpdateUser(String name, String surname,
      String resAddress, String phoneNumber, String description) async {
    try {
      // await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return "You have successfully been registered!";
    } catch(e) {
      return e;
    }
  }
  
}