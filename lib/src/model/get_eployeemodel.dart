import 'package:json_annotation/json_annotation.dart';
part 'get_eployeemodel.g.dart';

@JsonSerializable()
class GetEmployeeModel {
  String fullName;
  String address;
  String userName;
  String password;
  String mobileNumber;
  String email;
  String alternativeMobile;
  String designation;
  String relationship;
  String gender;
  String dateofBirth;
  int age;
  String aadharCardNumber;
  String panCardNumber;
  String employeePhoto;
  String panCardPhoto;
  List<String> aadharCardPhoto;
  List<String> cirtificates;
  String createdAt;

  GetEmployeeModel({
    required this.fullName,
    required this.aadharCardNumber,
    required this.aadharCardPhoto,
    required this.address,
    required this.age,
    required this.alternativeMobile,
    required this.cirtificates,
    required this.createdAt,
    required this.dateofBirth,
    required this.designation,
    required this.email,
    required this.employeePhoto,
    required this.gender,
    required this.mobileNumber,
    required this.panCardNumber,
    required this.panCardPhoto,
    required this.password,
    required this.relationship,
    required this.userName,
  });

  factory GetEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$GetEmployeeModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetEmployeeModelToJson(this);
}
