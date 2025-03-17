import 'package:get/get.dart';
import '../../data/repository/repository_interface.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(repository: Get.find<RepositoryInterface>()));
  }
}
