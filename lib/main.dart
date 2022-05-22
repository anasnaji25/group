import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/check_for_logged_in.dart';
import 'package:group/src/controllers/employee_controller.dart';

import 'src/controllers/authentication_controller.dart';
import 'src/controllers/groups_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(EmployeeController());
  Get.put(AuthenticationController());
  Get.put(GroupsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Finanace app',
      debugShowCheckedModeBanner: false,
      home: CheckForLogin(),
    );
  }
}
