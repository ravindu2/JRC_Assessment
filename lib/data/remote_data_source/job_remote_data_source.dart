import '../models/job_model.dart';
import '../services/api_service.dart';

class JobRemoteDataSource {
  final ApiService _apiService;

  JobRemoteDataSource(this._apiService);

  Future<List<JobModel>> getJobList(String userId) async {
    final response = await _apiService.getJobList(userId: userId);
    return (response.data as List)
        .map((json) => JobModel.fromJson(json))
        .toList();
  }
}
