import 'package:jrc_assement/data/models/login_model.dart';
import '../local_data_source/localdata_source.dart';
import '../remote_data_source/remote_data_source.dart';
import '../models/job_model.dart';
import 'repository_interface.dart';

class Repository implements RepositoryInterface {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  Repository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<JobModel>> getJobs(String userId) async {
    try {
      final jobs = await remoteDataSource.getJobList(userId);
      await localDataSource.saveJobs(jobs.take(6).toList());
      return await localDataSource.getJobs();
    } catch (e) {
      print('Error fetching jobs: $e');
      try {
        final cachedJobs = await localDataSource.getJobs();
        if (cachedJobs.isNotEmpty) {
          return cachedJobs;
        }
      } catch (cacheError) {
        print('Error fetching cached jobs: $cacheError');
      }
      throw Exception('Failed to fetch jobs: $e');
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
