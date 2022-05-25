import 'package:json_annotation/json_annotation.dart';
part 'customers_model.g.dart';

@JsonSerializable()
class CustomerModel {
  String customerphoto;
  String customerName;
  String husbandName;
  String motherName;
  String dateOfBirth;
  String gender;
  String permanentAddress;
  String communicationAddress;
  String aadharNumber;
  String panCardNumber;
  String nominiName;
  String emailId;
  String mobileNumber;
  String alternativeMobileNumber;
  String relationShip;
  double latitude;
  double longitude;
  String placeName;
  String createdAt;
  List<String> aadharCardPhotos;
  List<String> panCardPhoto;

  CustomerModel({
    required this.customerphoto,
    required this.customerName,
    required this.husbandName,
    required this.motherName,
    required this.dateOfBirth,
    required this.gender,
    required this.permanentAddress,
    required this.communicationAddress,
    required this.aadharNumber,
    required this.panCardNumber,
    required this.nominiName,
    required this.emailId,
    required this.mobileNumber,
    required this.alternativeMobileNumber,
    required this.relationShip,
    required this.latitude,
    required this.longitude,
    required this.placeName,
    required this.aadharCardPhotos,
    required this.panCardPhoto,
    required this.createdAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
