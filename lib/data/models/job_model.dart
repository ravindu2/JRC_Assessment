class JobModel {
  final String id;
  final String title;
  final String location;
  final String category;
  final String status;
  final bool isUrgent;
  final String postDate;
  final bool quoteAvailable;

  JobModel({
    required this.id,
    required this.title,
    required this.location,
    required this.category,
    required this.status,
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
      status: json['statusId'].toString(),
      isUrgent: (json['urgencyTypeId'] == 1),
      postDate: json['postedDateTime'] ?? '',
      quoteAvailable: json['price'] != null && json['price'] != '0.000000',
    );
  }
}
