import '../models/job_model.dart';
import '../models/login_model.dart';
import '../services/api_service.dart';

class RemoteDataSource {
  final ApiService _apiService;

  RemoteDataSource(this._apiService);

  Future<List<JobModel>> getJobList(String userId) async {
    final response = await _apiService.getJobList(userId: userId);
    return (response.data as List)
        .map((json) => JobModel.fromJson(json))
        .toList();
  }

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
