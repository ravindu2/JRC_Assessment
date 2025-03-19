import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/models/login_model.dart';
import 'package:jrc_assement/data/services/isar_initializer.dart';
import 'package:jrc_assement/data/local_data_source/local_data_source_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource implements LocalDataSourceInterface {
  Future<Isar> _getIsar() async {
    return await IsarInitializer.initialize();
  }

  static const String _userKey = 'user_data';

  @override
  Future<void> saveJobs(List<JobModel> jobs) async {
    final isar = await _getIsar();
    await isar.writeTxn(() async {
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);
    if (userString != null) {
      final jsonMap = jsonDecode(userString);
      return UserModel.fromJson(jsonMap);
    }
    return null;
  }

  @override
  Future<void> close() async {
    await IsarInitializer.close();
  }
}
