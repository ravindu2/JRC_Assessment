import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/models/login_model.dart';

abstract class RemoteDataSourceInterface {
  Future<List<JobModel>> getJobList(String userId);
  Future<UserModel> login(String email, String password);
}
