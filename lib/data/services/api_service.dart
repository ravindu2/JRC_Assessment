import 'package:dio/dio.dart';
import 'api_constants.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
    ),
  );

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndpoint,
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
  }) async {
    try {
      final url = ApiConstants.jobListEndpoint;
      final queryParams = {
        'userId': userId,
        'pageNumber': ApiConstants.defaultPageNumber.toString(),
        'pageSize': ApiConstants.defaultPageSize.toString(),
        'headerPm': ApiConstants.defaultHeaderPm.toString(),
      };
      final fullUrl = '${_dio.options.baseUrl}$url';

      final response = await _dio.get(
        fullUrl,
        queryParameters: queryParams,
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
          headers: ApiConstants.defaultHeaders,
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
