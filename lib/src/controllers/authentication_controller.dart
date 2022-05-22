import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/check_for_logged_in.dart';

class AuthenticationController extends GetxController {
  ///initials///
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("<<<<<account created>>>>>>");
      print(credential.user!.email);
      print(credential.additionalUserInfo!.username);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar(
            "Enter a Strong Password", 'The password provided is too weak.',
            colorText: Colors.white, backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
            "Email already in use", 'The account already exists for that email',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
    }
  }

  signInToAccount(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Get.offAll(() => CheckForLogin());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("No user found", 'No user found for that email.',
            colorText: Colors.white, backgroundColor: Colors.red);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar(
            "Password is incorrect", 'Wrong password provided for that user.',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> employeeSignIn(
      String username, String password) async {
    final employeeRef = _firestore.collection("Employees");

    var employeeSnapshot =
        await employeeRef.where("userName", isEqualTo: username).get();

    return employeeSnapshot.docs;
  }



  signOutAdmin() async{
    await FirebaseAuth.instance.signOut();
  }
}
