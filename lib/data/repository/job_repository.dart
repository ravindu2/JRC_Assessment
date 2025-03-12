import 'package:get/get.dart';
import 'package:jrc_assement/data/models/login_model.dart';
import '../local_data_source/job_localdata_source.dart';
import '../remote_data_source/job_remote_data_source.dart';
import '../models/job_model.dart';

class JobRepository {
  final JobRemoteDataSource remoteDataSource;
  final JobLocalDataSource localDataSource;

  JobRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<List<JobModel>> getJobs(String userId) async {
    final jobs = await remoteDataSource.getJobList(userId);
    await localDataSource.saveJobs(jobs.take(6).toList());

    try {
      if (jobs.isNotEmpty) {
        await localDataSource.saveJobs(jobs.take(6).toList());
        return jobs;
      } else {
        return await localDataSource.getJobs();
      }
    } catch (e) {
      return await localDataSource.getJobs();
      print(e);
    }
  }

  Future<UserModel> login(String email, String password) async {
    final user = await remoteDataSource.login(email, password);
    await localDataSource.saveUser(user);
    return user;
  }

  Future<bool> isLoggedIn() async {
    final user = await localDataSource.getUser();
    return user != null;
  }
}
