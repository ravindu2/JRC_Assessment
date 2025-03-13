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
      final url = 'smartView/pm/jobList';
      final queryParams = {
        'userId': userId,
        'pageNumber': pageNumber.toString(),
        'pageSize': pageSize.toString(),
        'headerPm': headerPm.toString(),
      };
      final fullUrl = '${_dio.options.baseUrl}$url';
      final headers = {
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'ChannelId': 'T4E18DDD47BDE8958C579F1C',
        'ClientSecret': '134C18DDDE478DDE895BC5769FB1C',
      };
      final response = await _dio.get(
        fullUrl,
        queryParameters: queryParams,
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
          headers: headers,
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
