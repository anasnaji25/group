import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/const/colors.dart';
import 'package:group/src/controllers/authentication_controller.dart';
import 'package:group/src/model/get_eployeemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/fonts.dart';
import '../home_view/home_page.dart';
import '../home_view/task_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final authenticationController = Get.find<AuthenticationController>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                  ),
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () async {
                      String admin = "admin@gmail.com";
                      if (emailController.text == admin) {
                        await authenticationController.signInToAccount(
                            emailController.text, passwordController.text);
                      } else {
                        var employeeList =
                            await authenticationController.employeeSignIn(
                                emailController.text, passwordController.text);

                        if (employeeList.isEmpty) {
                          Get.snackbar("Username is Not Found",
                              "Please Enter the correct username",
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        } else {
                          var data = employeeList.first.data();
                          var employeeModel = GetEmployeeModel.fromJson(data);
                          if (employeeModel.password ==
                              passwordController.text) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString(
                                'userName', employeeModel.userName);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TaskScreenView()));
                          } else {
                            Get.snackbar("Incorrect Password",
                                "Please Enter the correct password",
                                colorText: Colors.white,
                                backgroundColor: Colors.red);
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 5, 3, 165)),
                      alignment: Alignment.center,
                      child: Text("Login",
                          style: roboto.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ));
  }
}
