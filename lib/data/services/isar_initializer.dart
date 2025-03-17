import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/job_model.dart';
import '../models/login_model.dart';

class IsarInitializer {
  static Isar? _isar;
  static bool _isInitializing = false;

  static Future<Isar> initialize() async {
    if (_isar != null) return _isar!;

    if (_isInitializing) {
      while (_isInitializing) {
        await Future.delayed(Duration(milliseconds: 100));
      }
      return _isar!;
    }

    _isInitializing = true;
    try {
      final dir = await getApplicationDocumentsDirectory();
      _isar = Isar.getInstance('jobInstance');
      _isar ??= await Isar.open(
        [UserModelSchema, JobModelSchema],
        directory: dir.path,
        name: 'jobInstance',
      );
      return _isar!;
    } finally {
      _isInitializing = false;
    }
  }

  static Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }
}
