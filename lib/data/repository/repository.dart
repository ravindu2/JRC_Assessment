import 'package:jrc_assement/data/local_data_source/local_data_source_interface.dart';
import 'package:jrc_assement/data/models/login_model.dart';
import 'package:jrc_assement/data/remote_data_source/remote_data_source_interface.dart';

import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/repository/repository_interface.dart';

class Repository implements RepositoryInterface {
  final RemoteDataSourceInterface remoteDataSource;
  final LocalDataSourceInterface localDataSource;

  Repository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<JobModel>> getJobs(String userId) async {
    try {
      final cachedJobs = await localDataSource.getJobs();
      if (cachedJobs.isNotEmpty) {
        return cachedJobs;
      }
      final jobs = await remoteDataSource.getJobList(userId);
      await localDataSource.saveJobs(jobs.take(6).toList());
      return jobs;
    } catch (e) {
      throw Exception('Failed to fetch initial jobs: $e');
    }
  }

  @override
  Future<List<JobModel>> getJobsLocal() async {
    return await localDataSource.getJobs();
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final user = await remoteDataSource.login(email, password);
    await localDataSource.saveUser(user);
    return user;
  }

  @override
  Future<bool> isLoggedIn() async {
    final user = await localDataSource.getUser();
    return user != null;
  }

  @override
  Future<UserModel?> localusers() async {
    final user = await localDataSource.getUser();
    return user;
  }
}
