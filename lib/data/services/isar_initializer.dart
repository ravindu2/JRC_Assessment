import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jrc_assement/data/models/job_model.dart';

class IsarInitializer {
  static Isar? _isar;

  static Future<Isar> initialize() async {
    if (_isar != null) return _isar!;
    try {
      final dir = await getApplicationDocumentsDirectory();
      _isar = Isar.getInstance('jobInstance');
      _isar ??= await Isar.open(
        [JobModelSchema],
        directory: dir.path,
        name: 'jobInstance',
      );
      return _isar!;
    } catch (e) {
      throw Exception("failed to isar initialized");
    }
  }

  static Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }
}
