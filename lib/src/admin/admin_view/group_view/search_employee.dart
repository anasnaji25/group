import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/employee_details_view.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/controllers/employee_controller.dart';
import 'package:group/src/controllers/groups_controller.dart';

class SearchEmployee extends StatefulWidget {
  SearchEmployee({Key? key}) : super(key: key);

  @override
  State<SearchEmployee> createState() => _SearchEmployeeState();
}

class _SearchEmployeeState extends State<SearchEmployee> {
  final employeeController = Get.find<EmployeeController>();
  final groupController = Get.find<GroupsController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Container(
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black45)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: size.width * 0.65,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration:
                            InputDecoration.collapsed(hintText: "Search"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[900]),
                      alignment: Alignment.center,
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: size.height * 0.8,
            child: GetBuilder<EmployeeController>(
                builder: (employeeController) => ListView.builder(
                    itemCount: employeeController.employeesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 7, bottom: 7),
                        child: InkWell(
                          onTap: () {
                            groupController.isEmployeeSelected(true);
                            groupController.employeeData =
                                employeeController.employeesList[index];
                            groupController.employeeName(employeeController
                                .employeesList[index].fullName);
                            Get.back();
                          },
                          child: Container(
                            height: 90,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.network(
                                          employeeController
                                              .employeesList[index]
                                              .employeePhoto,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          employeeController
                                              .employeesList[index].fullName,
                                          style: roboto.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          employeeController
                                              .employeesList[index].designation,
                                          style: roboto.copyWith(
                                              fontSize: 14,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          )
        ],
      ),
    );
  }
}
