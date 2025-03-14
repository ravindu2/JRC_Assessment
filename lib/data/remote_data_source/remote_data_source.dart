// remote_data_source.dart
import '../models/job_model.dart';
import '../models/login_model.dart';
import '../services/api_service.dart';
import 'remote_data_source_interface.dart';

class RemoteDataSource implements IRemoteDataSource {
  final ApiService _apiService;

  RemoteDataSource(this._apiService);

  @override
  Future<List<JobModel>> getJobList(String userId) async {
    final response = await _apiService.getJobList(userId: userId);
    return (response.data as List)
        .map((json) => JobModel.fromJson(json))
        .toList();
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
