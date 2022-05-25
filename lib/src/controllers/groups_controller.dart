import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/admin_dashboard_view.dart';
import 'package:group/src/model/customer_model/customers_model.dart';
import 'package:group/src/model/get_eployeemodel.dart';
import 'package:group/src/model/group_model/group_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupsController extends GetxController {
  RxInt isMonthlyOrWeekly = 1.obs;
  RxString collectionPeriod = "".obs;
  RxString collectionTime = "".obs;

  ///initials///
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isEmployeeSelected = false.obs;
  RxString employeeName = "".obs;

  late GetEmployeeModel employeeData;

  List<GroupModel> listOfGroups = [];
  List<CustomerModel> listOfCustomer = [];

  setDefault() {
    isMonthlyOrWeekly(1);
    isEmployeeSelected(false);
    employeeName("");
    collectionPeriod("");
    collectionTime("");
  }

  createGroup(GroupModel newGroup) async {
    _firestore.collection("Groups").add({
      "group_id": newGroup.groupCode,
      "group_name": newGroup.groupName,
      "collection_period": newGroup.collectionPeriod,
      "employee_name": newGroup.employeeName,
      "user_name": newGroup.employeeUserName,
      "is_monthly_or_weekly": newGroup.isMonthlyOrWeekly,
      "created_at": newGroup.createdAt
    }).then((DocumentReference doc) {
      print('DocumentSnapshot added with ID: ${doc.id}');
      Get.snackbar("Group Created SuccessFully", "See View Groups",
          backgroundColor: Colors.green, colorText: Colors.white);
      // isLoading(false);
      Get.offAll(() => AdminDashboardView());
    }).onError((error, stackTrace) {
      Get.snackbar("Something Went Wrong", "please check ",
          backgroundColor: Colors.red, colorText: Colors.white);
      // isLoading(false);
    });
  }

  // getGroupsList2() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? username = prefs.getString("userName");
  //   var ref =
  //       _firestore.collection("Groups").where("user_name", isEqualTo: username);
  //   var snapshot = await ref.get();
  //   var data = snapshot.docs.map((s) => s.data());
  //   var groups = data.map((d) => GroupModel.fromJson(d));
  //   listOfGroups = groups.toList();
  //   print("list length>>>>>>>>>>>>>>>>>>${listOfGroups.length}");
  //   update();
  // }

  getGroupsList() async {
    List<GroupModel> templist = [];
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("userName");
    var ref = _firestore.collection("Groups").where("user_name", isEqualTo: username);
    var snapshot = await ref.get();
    var data = snapshot.docs;
    data.forEach((element) => templist.add(GroupModel(
        collectionPeriod: element.data()["collection_period"],
        createdAt: element.data()["created_at"],
        employeeName: element.data()["employee_name"],
        employeeUserName: element.data()["user_name"],
        groupCode: element.data()["group_id"],
        groupName: element.data()["group_name"],
        isMonthlyOrWeekly: element.data()["is_monthly_or_weekly"])));
    listOfGroups = templist;
    print("data 2 length>>>>>>>>>>>>>>>>>>${data.first.data()}");
    update();
  }
}
