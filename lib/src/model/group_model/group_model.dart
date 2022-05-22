import 'package:json_annotation/json_annotation.dart';
part 'group_model.g.dart';

@JsonSerializable()
class GroupModel {
  int groupCode;
  String groupName;
  String collectionPeriod;
  String employeeName;
  String employeeUserName;
  int isMonthlyOrWeekly;
  String createdAt;

  GroupModel({
    required this.collectionPeriod,
    required this.groupName,
    required this.createdAt,
    required this.employeeName,
    required this.employeeUserName,
    required this.groupCode,
    required this.isMonthlyOrWeekly,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$GroupModelToJson(this);
}
