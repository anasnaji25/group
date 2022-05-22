import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/admin_dashboard_view.dart';
import 'package:group/src/admin/admin_view/group_view/search_employee.dart';
import 'package:group/src/const/fonts.dart';
import 'package:group/src/controllers/employee_controller.dart';
import 'package:group/src/controllers/groups_controller.dart';
import 'package:group/src/model/group_model/group_model.dart';

import '../../components/textfield_borders.dart';

class AddNewGroup extends StatefulWidget {
  AddNewGroup({Key? key}) : super(key: key);

  @override
  State<AddNewGroup> createState() => _AddNewGroupState();
}

class _AddNewGroupState extends State<AddNewGroup> {
  final employeeController = Get.find<EmployeeController>();
  final groupController = Get.find<GroupsController>();
  Random random = Random();
  int groupCode = 0;

  var groupnameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    generateGroupCode();
    groupController.setDefault();
  }

  generateGroupCode() {
    int random_number = random.nextInt(3765);
    groupCode = random_number;
  }

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
      body: Obx(() => ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Add New Group",
                  style: roboto.copyWith(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: size.width,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Group Code : $groupCode",
                          style: roboto.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: groupnameController,
                          decoration: InputDecoration(
                              label: const Text("Group Name"),
                              enabledBorder: myinputborder(),
                              focusedBorder: myfocusborder()),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      groupController.collectionPeriod.value == ""
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context),
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: size.width - 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue.withOpacity(0.4)),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Select Collection Period",
                                      style: roboto.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context),
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: size.width - 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey),
                                      color: const Color.fromARGB(
                                              255, 237, 242, 247)
                                          .withOpacity(0.4)),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: groupController
                                                .isMonthlyOrWeekly.value ==
                                            0
                                        ? Text(
                                            "${groupController.collectionPeriod} Every ${groupController.collectionTime}",
                                            style: roboto.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          )
                                        : Text(
                                            "${groupController.collectionPeriod} Every ${groupController.collectionTime}'th",
                                            style: roboto.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      groupController.isEmployeeSelected.isFalse
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => SearchEmployee());
                                },
                                child: Container(
                                  height: 60,
                                  width: size.width - 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue.withOpacity(0.4)),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Select Employee",
                                      style: roboto.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => SearchEmployee());
                                },
                                child: Container(
                                  height: 60,
                                  width: size.width - 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey),
                                      color: const Color.fromARGB(
                                              255, 237, 242, 247)
                                          .withOpacity(0.4)),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "${groupController.employeeName}",
                                        style: roboto.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      )),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              )
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
        child: InkWell(
          onTap: () {
            GroupModel newGroup = GroupModel(
                collectionPeriod: groupController.collectionTime.value,
                groupName: groupnameController.text,
                createdAt: DateTime.now().toString(),
                employeeName: groupController.employeeName.value,
                employeeUserName: groupController.employeeData.userName,
                groupCode: groupCode,
                isMonthlyOrWeekly: groupController.isMonthlyOrWeekly.value);

            groupController.createGroup(newGroup);
          },
          child: Container(
            height: 60,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 4, 212, 150)),
            alignment: Alignment.center,
            child: Text(
              "Create Group",
              style: roboto.copyWith(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.isMonthlyOrWeekly(0);
                  groupController.collectionPeriod("Weekly");
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildWeeklyPopupDialog(context),
                  );
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Weekly",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.isMonthlyOrWeekly(1);
                  groupController.collectionPeriod("Monthly");
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildMonthlyPopupDialog(context),
                  );
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Monthly",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWeeklyPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('On Every'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("Monday");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Monday",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("Tuesday");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Tuesday",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("Wednesday");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Wednesday",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("Thursday");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Thursday",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("Friday");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Friday",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("Saturday");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "Saturday",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('On Every Month'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("1");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "1",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("2");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("3");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "3",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("4");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "4",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("5");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "5",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("6");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "6",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("7");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "7",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("8");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "8",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("9");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "9",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("10");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "10",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("11");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "11",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("12");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "12",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("13");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "13",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("14");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "14",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("15");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "15",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("16");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "16",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("17");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "17",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("18");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "18",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("19");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "19",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("20");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "20",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("21");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "21",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("22");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "22",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("23");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "23",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("24");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "24",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("25");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "25",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  groupController.collectionTime("26");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "26",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("27");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "27",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  groupController.collectionTime("28");
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 119, 175)),
                  alignment: Alignment.center,
                  child: Text(
                    "28",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  alignment: Alignment.center,
                  child: Text(
                    "",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  alignment: Alignment.center,
                  child: Text(
                    "",
                    style: roboto.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
