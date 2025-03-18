import 'package:dio/dio.dart';
import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/data/models/login_model.dart';
import 'package:jrc_assement/data/services/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<UserModel> login(
    @Field('Email') String email,
    @Field('Password') String password,
  );

  @GET(ApiConstants.jobListEndpoint)
  Future<List<JobModel>> getJobList({
    @Query('userId') required String userId,
    @Query('pageNumber') String pageNumber = ApiConstants.defaultPageNumber,
    @Query('pageSize') String pageSize = ApiConstants.defaultPageSize,
    @Query('headerPm') String headerPm = ApiConstants.defaultHeaderPm,
  });
}
