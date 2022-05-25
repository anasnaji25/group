import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/components/textfield_borders.dart';
import 'package:group/src/controllers/employee_controller.dart';
import 'package:group/src/model/employee_models.dart';
import 'package:group/src/widgets/common_widgets/choose_photo_bottom_sheet.dart';
import 'package:group/src/widgets/employees_widgets/employee_cirtificates_choose.dart';
import 'package:group/src/widgets/employees_widgets/employee_photo_picker.dart';
import 'package:group/src/widgets/employees_widgets/eployee_adhar_card_choose.dart';

import '../../const/fonts.dart';

class AddNewMemberView extends StatefulWidget {
  AddNewMemberView({Key? key}) : super(key: key);

  @override
  State<AddNewMemberView> createState() => _AddNewMemberViewState();
}

class _AddNewMemberViewState extends State<AddNewMemberView> {
  var _chosenValue;
  var _chosenValue2;

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
      ),
      body: Obx(() => employeeController.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Add New Member",
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
                    height: size.height * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Personal Information",
                            style: roboto.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            // controller: employeeController.empFullName,
                            decoration: InputDecoration(
                                label: const Text("Full Name"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            // controller: employeeController.empFullName,
                            decoration: InputDecoration(
                                label: const Text("Husband Name"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            // controller: employeeController.empFullName,
                            decoration: InputDecoration(
                                label: const Text("Mother Name"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            // controller: employeeController.empFullName,
                            decoration: InputDecoration(
                                label: const Text("Nomini Name"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empAddress,
                            maxLines: 3,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                label: const Text("Permanent Address"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empAddress,
                            maxLines: 3,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                label: const Text("Communication Address"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Contact details",
                            style: roboto.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empMobileNumber,
                            decoration: InputDecoration(
                                label: const Text("Mobile Number"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empAlternativeMobNum,
                            decoration: InputDecoration(
                                label: const Text("Alternative Mobile Number"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empEmail,
                            decoration: InputDecoration(
                                label: const Text("Email"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Member details",
                            style: roboto.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                child: DropdownButton<String>(
                                  value: _chosenValue2,
                                  //elevation: 5,
                                  style: const TextStyle(color: Colors.black),

                                  items: <String>[
                                    'Single',
                                    'Married',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: const Text(
                                    "Relationship Status",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onChanged: (value) {
                                    employeeController
                                        .empRelationshipStatus(value);
                                    setState(() {
                                      _chosenValue2 = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                child: DropdownButton<String>(
                                  value: _chosenValue,
                                  //elevation: 5,
                                  style: const TextStyle(color: Colors.black),

                                  items: <String>[
                                    'Male',
                                    'Female',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: const Text(
                                    "Gender",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onChanged: (value) {
                                    employeeController.empGender(value);
                                    setState(() {
                                      _chosenValue = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empDateOfBirth,
                            decoration: InputDecoration(
                                label: const Text("Date of Birth"),
                                hintText: "eg.25-03-2000",
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empAge,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                label: const Text("Age"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Loan Details",
                            style: roboto.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            // controller: employeeController.empAge,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                label: const Text("Loan Amount"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Member Documents",
                            style: roboto.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900]),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empAadharCardNumber,
                            decoration: InputDecoration(
                                label: const Text("Aadhar card number"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextField(
                            controller: employeeController.empPanCardNumber,
                            decoration: InputDecoration(
                                label: const Text("Pan card number"),
                                enabledBorder: myinputborder(),
                                focusedBorder: myfocusborder()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Upload Customer Photo",
                            style: roboto.copyWith(
                                color: Colors.black45, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  chooseEmployeePhotoBottomSheet(context);
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[900],
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        Text("Choose file",
                                            style: roboto.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => employeeController.employeephoto.value == ""
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      height: 80,
                                      child: Image.file(
                                        File(employeeController
                                            .employeephoto.value),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Upload Aadhar card photo (front & back side)",
                            style: roboto.copyWith(
                                color: Colors.black45, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  chooseEmpAadharCardPhotoBottomSheet(context);
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[900],
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        Text("Choose file",
                                            style: roboto.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<EmployeeController>(
                            builder: (_) => employeeController
                                    .employeeAadharCardPics.isEmpty
                                ? Container()
                                : Container(
                                    height: 80,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: employeeController
                                            .employeeAadharCardPics.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Container(
                                              height: 80,
                                              child: Image.file(
                                                File(employeeController
                                                        .employeeAadharCardPics[
                                                    index]),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          );
                                        }),
                                  )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Upload Pan card photo",
                            style: roboto.copyWith(
                                color: Colors.black45, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  choosePhotoBottomSheet(context);
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[900],
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        Text("Choose file",
                                            style: roboto.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => employeeController.employeePanCardPic.value ==
                                ""
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                      height: 80,
                                      child: Image.file(
                                        File(employeeController
                                            .employeePanCardPic.value),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                },
                                child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.indigo,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("Submit",
                                        style: roboto.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
