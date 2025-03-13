import 'package:jrc_assement/data/models/login_model.dart';
import '../local_data_source/localdata_source.dart';
import '../remote_data_source/remote_data_source.dart';
import '../models/job_model.dart';

class JobRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  JobRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<List<JobModel>> getJobs(String userId) async {
    final jobs = await remoteDataSource.getJobList(userId);
    await localDataSource.saveJobs(jobs.take(6).toList());
    return await localDataSource.getJobs();
  }

  Future<List<JobModel>> getJobsLocal() async {
    return await localDataSource.getJobs();
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

  Future<UserModel?> localusers() async {
    final user = await localDataSource.getUser();
    return user;
  }
}
