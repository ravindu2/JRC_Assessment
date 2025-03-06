import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://staging.bricksandagent.com/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'auth/login',
        data: {
          'Email': email,
          'Password': password,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getJobList({
    required String userId,
    int pageNumber = 1,
    int pageSize = 10,
    int headerPm = 102,
  }) async {
    try {
      final response = await _dio.get(
        'smartView/pm/jobList',
        queryParameters: {
          'userId': userId,
          'pageNumber': pageNumber,
          'pageSize': pageSize,
          'headerPm': headerPm,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
