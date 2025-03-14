import '../models/job_model.dart';
import '../models/login_model.dart';

abstract class LocalDataSourceInterface {
  Future<void> saveJobs(List<JobModel> jobs);
  Future<List<JobModel>> getJobs();
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> close();
}
