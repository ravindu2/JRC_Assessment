import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/job_model.dart';
import '../models/login_model.dart';

class JobLocalDataSource {
  static Isar? _isar;
  static bool _isInitializing = false;

  JobLocalDataSource() {
    if (_isar == null && !_isInitializing) {
      _initIsar();
    }
  }

  Future<void> _initIsar() async {
    if (_isar != null) return;

    _isInitializing = true;
    try {
      final dir = await getApplicationDocumentsDirectory();
      _isar = Isar.getInstance('jobInstance');
      if (_isar == null) {
        _isar = await Isar.open(
          [UserModelSchema, JobModelSchema],
          directory: dir.path,
          name: 'jobInstance', // Explicitly name the instance
        );
      }
    } finally {
      _isInitializing = false;
    }
  }

  Future<Isar> _getIsar() async {
    if (_isar == null) {
      await _initIsar();
    }
    if (_isar == null) {
      throw Exception('Failed to initialize Isar database');
    }
    return _isar!;
  }

  Future<void> saveJobs(List<JobModel> jobs) async {
    final isar = await _getIsar();
    await isar.writeTxn(() async {
      await isar.jobModels.putAll(jobs);
    });
  }

  Future<List<JobModel>> getJobs() async {
    final isar = await _getIsar();
    return await isar.jobModels.where().findAll();
  }

  Future<void> saveUser(UserModel user) async {
    final isar = await _getIsar();
    await isar.writeTxn(() async {
      await isar.userModels.put(user);
    });
  }

  Future<UserModel?> getUser() async {
    final isar = await _getIsar();
    return await isar.userModels.where().findFirst();
  }

  Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }
}
