import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/add_employees_view.dart';
import 'package:group/src/admin/admin_view/add_new_groups.dart';
import 'package:group/src/admin/admin_view/view_employee.dart';
import 'package:group/src/controllers/authentication_controller.dart';
import 'package:group/src/controllers/employee_controller.dart';

import '../../const/fonts.dart';

class AdminDashboardView extends StatefulWidget {
  AdminDashboardView({Key? key}) : super(key: key);

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  final employeeController = Get.find<EmployeeController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          InkWell(
              onTap: () {
                Get.find<AuthenticationController>().signOutAdmin();
              },
              child: const Padding(
                padding:  EdgeInsets.only(right: 10),
                child:  Icon(Icons.logout, color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Admin Dashboard",
              style: roboto.copyWith(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              width: size.width,
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddEmployeeView()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[900]),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person_add,
                                color: Colors.white,
                                size: 35,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Add Employes",
                                  style: roboto.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue[900]),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.groups,
                              color: Colors.white,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("View Groups",
                                style: roboto.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13))
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue[900]),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.group,
                              color: Colors.white,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("View Customers",
                                style: roboto.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          employeeController.getListOfEmployees();
                          Get.to(() => ViewEmployee());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[900]),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.people_outline,
                                color: Colors.white,
                                size: 35,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("View Employees",
                                  style: roboto.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue[900]),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.compare_arrows,
                              color: Colors.white,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Transfer",
                                style: roboto.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13))
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue[900]),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 35,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Notifications",
                                style: roboto.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          employeeController.getListOfEmployees();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewGroup()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[900]),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.post_add_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Add New Group",
                                  style: roboto.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
