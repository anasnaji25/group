// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      customerphoto: json['customerphoto'] as String,
      customerName: json['customerName'] as String,
      husbandName: json['husbandName'] as String,
      motherName: json['motherName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      permanentAddress: json['permanentAddress'] as String,
      communicationAddress: json['communicationAddress'] as String,
      aadharNumber: json['aadharNumber'] as String,
      panCardNumber: json['panCardNumber'] as String,
      nominiName: json['nominiName'] as String,
      emailId: json['emailId'] as String,
      mobileNumber: json['mobileNumber'] as String,
      alternativeMobileNumber: json['alternativeMobileNumber'] as String,
      relationShip: json['relationShip'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      placeName: json['placeName'] as String,
      aadharCardPhotos: (json['aadharCardPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      panCardPhoto: (json['panCardPhoto'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customerphoto': instance.customerphoto,
      'customerName': instance.customerName,
      'husbandName': instance.husbandName,
      'motherName': instance.motherName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'permanentAddress': instance.permanentAddress,
      'communicationAddress': instance.communicationAddress,
      'aadharNumber': instance.aadharNumber,
      'panCardNumber': instance.panCardNumber,
      'nominiName': instance.nominiName,
      'emailId': instance.emailId,
      'mobileNumber': instance.mobileNumber,
      'alternativeMobileNumber': instance.alternativeMobileNumber,
      'relationShip': instance.relationShip,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'placeName': instance.placeName,
      'createdAt': instance.createdAt,
      'aadharCardPhotos': instance.aadharCardPhotos,
      'panCardPhoto': instance.panCardPhoto,
    };
