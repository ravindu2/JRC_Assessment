import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/models/login_model.dart';

abstract class RepositoryInterface {
  Future<List<JobModel>> getJobs(String userId);
  Future<List<JobModel>> getJobsLocal();
  Future<UserModel> login(String email, String password);
  Future<bool> isLoggedIn();
  Future<UserModel?> localusers();
}
