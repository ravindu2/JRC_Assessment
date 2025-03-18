import 'package:isar/isar.dart';
import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/models/login_model.dart';
import 'package:jrc_assement/data/services/isar_initializer.dart';
import 'package:jrc_assement/data/local_data_source/local_data_source_interface.dart';

class LocalDataSource implements LocalDataSourceInterface {
  Future<Isar> _getIsar() async {
    return await IsarInitializer.initialize();
  }

  @override
  Future<void> saveJobs(List<JobModel> jobs) async {
    final isar = await _getIsar();
    await isar.writeTxn(() async {
      await isar.jobModels.clear();
      await isar.jobModels.putAll(jobs);
    });
  }

  @override
  Future<List<JobModel>> getJobs() async {
    final isar = await _getIsar();
    return await isar.jobModels.where().findAll();
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final isar = await _getIsar();
    await isar.writeTxn(() async {
      await isar.userModels.put(user);
    });
  }

  @override
  Future<UserModel?> getUser() async {
    final isar = await _getIsar();
    return await isar.userModels.where().findFirst();
  }

  @override
  Future<void> close() async {
    await IsarInitializer.close();
  }
}
