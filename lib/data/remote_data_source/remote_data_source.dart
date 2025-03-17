// remote_data_source.dart
import '../models/job_model.dart';
import '../models/login_model.dart';
import '../services/api_service.dart';
import 'package:jrc_assement/data/remote_data_source/remote_data_source_interface.dart';

class RemoteDataSource implements RemoteDataSourceInterface {
  final ApiService _apiService;

  RemoteDataSource(this._apiService);

  @override
  Future<List<JobModel>> getJobList(String userId) async {
    try {
      // Assuming _apiService returns a response with a data property
      final response = await _apiService.getJobList(userId: userId);
      print('API Response: ${response.data}');

      // Check if response.data is a list and convert to JobModel objects
      if (response.data is List) {
        final jobs = (response.data as List)
            .map((json) => JobModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return jobs;
      } else {
        throw Exception('Invalid API response format: Expected a list');
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      rethrow; // Rethrow the exception for handling by the caller
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _apiService.login(email, password);

    final data = response.data;
    final user = UserModel(
      userId: data['userId'] ?? '',
      isEmailConfirmed: data['isEmailConfirmed'] ?? false,
      ssoToken: data['ssoToken'] ?? '',
    );

    return user;
  }
}
