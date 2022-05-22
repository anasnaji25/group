// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_eployeemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEmployeeModel _$GetEmployeeModelFromJson(Map<String, dynamic> json) =>
    GetEmployeeModel(
      fullName: json['fullName'] as String,
      aadharCardNumber: json['aadharCardNumber'] as String,
      aadharCardPhoto: (json['aadharCardPhoto'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      address: json['address'] as String,
      age: json['age'] as int,
      alternativeMobile: json['alternativeMobile'] as String,
      cirtificates: (json['cirtificates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] as String,
      dateofBirth: json['dateofBirth'] as String,
      designation: json['designation'] as String,
      email: json['email'] as String,
      employeePhoto: json['employeePhoto'] as String,
      gender: json['gender'] as String,
      mobileNumber: json['mobileNumber'] as String,
      panCardNumber: json['panCardNumber'] as String,
      panCardPhoto: json['panCardPhoto'] as String,
      password: json['password'] as String,
      relationship: json['relationship'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$GetEmployeeModelToJson(GetEmployeeModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'address': instance.address,
      'userName': instance.userName,
      'password': instance.password,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'alternativeMobile': instance.alternativeMobile,
      'designation': instance.designation,
      'relationship': instance.relationship,
      'gender': instance.gender,
      'dateofBirth': instance.dateofBirth,
      'age': instance.age,
      'aadharCardNumber': instance.aadharCardNumber,
      'panCardNumber': instance.panCardNumber,
      'employeePhoto': instance.employeePhoto,
      'panCardPhoto': instance.panCardPhoto,
      'aadharCardPhoto': instance.aadharCardPhoto,
      'cirtificates': instance.cirtificates,
      'createdAt': instance.createdAt,
    };
