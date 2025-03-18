import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@collection
@JsonSerializable()
class JobModel {
  Id isarId = Isar.autoIncrement;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'address')
  final String location;

  @JsonKey(name: 'primaryJobType')
  final String category;

  @JsonKey(name: 'jobNumber')
  final String jobNumber;

  @JsonKey(name: 'urgencyTypeId')
  final int isUrgent;

  @JsonKey(name: 'postedDateTime')
  final String postDate;

  JobModel({
    required this.id,
    required this.title,
    required this.location,
    required this.category,
    required this.jobNumber,
    required this.isUrgent,
    required this.postDate,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
