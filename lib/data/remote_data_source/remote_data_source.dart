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
      final response = await _apiService.getJobList(userId: userId);
      print('API Response: ${response}');
      return response;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _apiService.login(email, password);
      print('Login Response: $response');
      return response;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
