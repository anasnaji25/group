import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/employee_details_view.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/controllers/employee_controller.dart';

class ViewEmployee extends StatefulWidget {
  ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
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
      ),
      body: GetBuilder<EmployeeController>(
          builder: (employeeController) => ListView.builder(
              itemCount: employeeController.employeesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 7, bottom: 7),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => EmployeeDetailsView(
                            employee: employeeController.employeesList[index],
                          ));
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
                                        .employeesList[index].employeePhoto,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontSize: 14, color: Colors.black45),
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
    );
  }
}
