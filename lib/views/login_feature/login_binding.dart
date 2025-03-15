import 'package:get/get.dart';
import '../../data/local_data_source/localdata_source.dart';
import '../../data/remote_data_source/remote_data_source.dart';
import '../../data/repository/repository.dart';
import '../../data/repository/repository_interface.dart';
import '../../data/services/api_service.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // Register dependencies
    Get.lazyPut<RepositoryInterface>(() => Repository(
          localDataSource: LocalDataSource(),
          remoteDataSource: RemoteDataSource(ApiService()),
        ));

    // Register controller
    Get.lazyPut<LoginController>(
        () => LoginController(repository: Get.find<RepositoryInterface>()));
  }
}
