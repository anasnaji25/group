// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
      collectionPeriod: json['collectionPeriod'] as String,
      groupName: json['groupName'] as String,
      createdAt: json['createdAt'] as String,
      employeeName: json['employeeName'] as String,
      employeeUserName: json['employeeUserName'] as String,
      groupCode: json['groupCode'] as int,
      isMonthlyOrWeekly: json['isMonthlyOrWeekly'] as int,
    );

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'groupCode': instance.groupCode,
      'groupName': instance.groupName,
      'collectionPeriod': instance.collectionPeriod,
      'employeeName': instance.employeeName,
      'employeeUserName': instance.employeeUserName,
      'isMonthlyOrWeekly': instance.isMonthlyOrWeekly,
      'createdAt': instance.createdAt,
    };
