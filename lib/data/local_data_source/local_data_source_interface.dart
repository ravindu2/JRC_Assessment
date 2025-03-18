import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/models/login_model.dart';

abstract class LocalDataSourceInterface {
  Future<void> saveJobs(List<JobModel> jobs);
  Future<List<JobModel>> getJobs();
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> close();
}
