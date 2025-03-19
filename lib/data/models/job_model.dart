import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@collection
@JsonSerializable()
class JobModel {
  Id isarId = Isar.autoIncrement;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @JsonKey(name: 'address', defaultValue: '')
  final String location;

  @JsonKey(name: 'primaryJobType', defaultValue: '')
  final String category;

  @JsonKey(name: 'jobNumber', defaultValue: '')
  final String jobNumber;

  @JsonKey(name: 'urgencyTypeId', defaultValue: 0)
  final int isUrgent;

  @JsonKey(name: 'postedDateTime', defaultValue: '')
  final String postDate;

  @JsonKey(name: 'postedBy', defaultValue: '')
  final String postedBy;

  JobModel({
    this.id,
    required this.title,
    required this.location,
    required this.category,
    required this.jobNumber,
    required this.isUrgent,
    required this.postDate,
    required this.postedBy,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}
