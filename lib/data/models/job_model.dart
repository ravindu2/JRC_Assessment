import 'package:isar/isar.dart';
part 'job_model.g.dart';

@collection
class JobModel {
  Id isarId = Isar.autoIncrement;
  final String id;
  final String title;
  final String location;
  final String category;
  final String jobNumber;
  final bool isUrgent;
  final String postDate;
  final bool quoteAvailable;

  JobModel({
    required this.id,
    required this.title,
    required this.location,
    required this.category,
    required this.jobNumber,
    required this.isUrgent,
    required this.postDate,
    required this.quoteAvailable,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      location: json['address'] ?? '',
      category: json['primaryJobType'] ?? '',
      jobNumber: json['jobNumber'] ?? '',
      isUrgent: (json['urgencyTypeId'] == 1),
      postDate: json['postedDateTime'] ?? '',
      quoteAvailable: json['price'] != null && json['price'] != '0.000000',
    );
  }
}
