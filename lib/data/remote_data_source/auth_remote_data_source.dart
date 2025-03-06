import '../services/api_service.dart';
import '../models/login_model.dart';

class AuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSource(this._apiService);

  Future<UserModel> login(String email, String password) async {
    final response = await _apiService.login(email, password);
    return UserModel.fromJson(response.data);
  }
}
