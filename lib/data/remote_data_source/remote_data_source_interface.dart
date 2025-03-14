import '../models/job_model.dart';
import '../models/login_model.dart';

abstract class IRemoteDataSource {
  Future<List<JobModel>> getJobList(String userId);
  Future<UserModel> login(String email, String password);
}
