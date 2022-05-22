import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group/src/admin/admin_view/admin_dashboard_view.dart';
import 'package:group/src/model/employee_models.dart';
import 'package:group/src/model/get_eployeemodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeController extends GetxController {
  //employee variables//
  final ImagePicker _picker = ImagePicker();
  RxString employeePanCardPic = "".obs;
  RxString employeephoto = "".obs;
  List<String> employeeAadharCardPics = [];
  List<String> employeeCirtificates = [];

  RxString base64employeePanCardPic = "".obs;
  RxString base64employeephoto = "".obs;
  List<String> base64employeeAadharCardPics = [];
  List<String> base64employeeCirtificates = [];

  //loading state
  RxBool isLoading = false.obs;

  List<GetEmployeeModel> employeesList = [];

  var empFullName = TextEditingController();
  var empAddress = TextEditingController();
  var empUserName = TextEditingController();
  var empPassword = TextEditingController();
  var empMobileNumber = TextEditingController();
  var empEmail = TextEditingController();
  var empAlternativeMobNum = TextEditingController();
  var empDesignation = TextEditingController();
  RxString empRelationshipStatus = "".obs;
  RxString empGender = "".obs;
  var empDateOfBirth = TextEditingController();
  var empAge = TextEditingController();
  var empAadharCardNumber = TextEditingController();
  var empPanCardNumber = TextEditingController();
  //>created at

  ///initials///
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  disposeEmployee() {
    employeePanCardPic("");
    employeephoto("");
    employeeAadharCardPics = [];
    employeeCirtificates = [];
    empFullName.clear();
    empAddress.clear();
    empMobileNumber.clear();
    empAlternativeMobNum.clear();
    empDesignation.clear();
    empRelationshipStatus("");
    empGender("");
    empDateOfBirth.clear();
    empAge.clear();
    empAadharCardNumber.clear();
    empPanCardNumber.clear();

    base64employeePanCardPic("");
    base64employeephoto("");
    base64employeeAadharCardPics = [];
    base64employeeCirtificates = [];
    update();
  }

  ///functions here (choose image)///
  Future<XFile?> chooseImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    return photo;
  }

  Future<XFile?> chooseImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<List<XFile>?> selectMultipleImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    return images;
  }

  List<String> convertListImagesBase64(List<String> images) {
    List<String> base64Images = [];
    for (var i = 0; i < images.length; i++) {
      File image = File(images[i]);
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      base64Images.add(base64Image);
    }

    return base64Images;
  }

  String convertStringImagesBase64(String images) {
    String base64Image = "";
    if (images != "") {
      File image = File(images);
      List<int> imageBytes = image.readAsBytesSync();
      String tbase64Image = base64Encode(imageBytes);
      base64Image = tbase64Image;
    }
    return base64Image;
  }

  Future<String> storeImage(
      String images, String employeename, String imageName) async {
    final storageReference = FirebaseStorage.instance
        .ref()
        .child("Employees/$employeename$imageName");
    await storageReference.putFile(File(images));
    final String url = await storageReference.getDownloadURL();
    return url;
  }

  Future<List<String>> storeListofImages(
      List<String> images, String employeename, String imageName) async {
    List<String> imageurls = [];
    for (var i = 0; i < images.length; i++) {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child("Employees/$employeename$imageName$i");
      await storageReference.putFile(File(images[i]));
      final String url = await storageReference.getDownloadURL();
      imageurls.add(url);
    }
    return imageurls;
  }

  ///database functions///
  addEmployeeToDatabase(EmployeeModel employeeModel) {
    _firestore.collection("Employees").add({
      "fullName": employeeModel.fullName,
      "address": employeeModel.address,
      "userName": employeeModel.userName,
      "password": employeeModel.password,
      "mobileNumber": employeeModel.mobileNumber,
      "email": employeeModel.email,
      "alternativeMobile": employeeModel.alternativeMobile,
      "designation": employeeModel.designation,
      "relationship": employeeModel.relationship,
      "gender": employeeModel.gender,
      "dateofBirth": employeeModel.dateofBirth,
      "age": employeeModel.age,
      "aadharCardNumber": employeeModel.aadharCardNumber,
      "panCardNumber": employeeModel.panCardNumber,
      "employeePhoto": employeeModel.employeePhoto,
      "panCardPhoto": employeeModel.panCardPhoto,
      "aadharCardPhoto": employeeModel.aadharCardPhoto,
      "cirtificates": employeeModel.cirtificates,
      "createdAt": employeeModel.createdAt,
    }).then((DocumentReference doc) {
      print('DocumentSnapshot added with ID: ${doc.id}');
      Get.snackbar("Employee Addedd SuccessFully", "See View Employees",
          backgroundColor: Colors.green, colorText: Colors.white);
      isLoading(false);
      Get.offAll(() => AdminDashboardView());
    }).onError((error, stackTrace) {
      Get.snackbar("Something Went Wrong", "please check ",
          backgroundColor: Colors.red, colorText: Colors.white);
      isLoading(false);
    });
  }

  getListOfEmployees() async {
    var ref = _firestore.collection("Employees");
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var employees = data.map((d) => GetEmployeeModel.fromJson(d));
    employeesList = employees.toList();
    update();
  }
}
