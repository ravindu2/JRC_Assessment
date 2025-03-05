import 'package:get/get.dart';
import 'package:jrc_assement/views/job_feature/job_controller.dart';

class JobBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobsController());
  }
}
