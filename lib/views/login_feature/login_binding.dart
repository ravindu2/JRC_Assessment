import 'package:get/get.dart';
import './login_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
