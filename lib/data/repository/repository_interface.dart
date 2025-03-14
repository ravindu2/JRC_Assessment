import '../models/job_model.dart';
import '../models/login_model.dart';

abstract class RepositoryInterface {
  Future<List<JobModel>> getJobs(String userId);
  Future<List<JobModel>> getJobsLocal();
  Future<UserModel> login(String email, String password);
  Future<bool> isLoggedIn();
  Future<UserModel?> localusers();
}
