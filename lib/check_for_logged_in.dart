import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/admin_dashboard_view.dart';
import 'package:group/src/view/home_view/task_view.dart';
import 'package:group/src/view/login_view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckForLogin extends StatefulWidget {
  CheckForLogin({Key? key}) : super(key: key);

  @override
  State<CheckForLogin> createState() => _CheckForLoginState();
}

class _CheckForLoginState extends State<CheckForLogin> {
  @override
  void initState() {
    super.initState();
    checkLogedin();
  }

  String admin = "admin@gmail.com";

  checkLogedin() async {
    final prefs = await SharedPreferences.getInstance();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        String? username = prefs.getString("userName");
        if (username == null) {
          Get.offAll(() => LoginView());
        } else {
          Get.offAll(() => TaskScreenView());
        }
      } else {
        print('User is signed in!');
        if (user.email == admin) {
          Get.offAll(() => AdminDashboardView());
        } else {
          String? username = prefs.getString("userName");
          if (username == null) {
            Get.offAll(() => LoginView());
          } else {
            Get.offAll(() => TaskScreenView());
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
