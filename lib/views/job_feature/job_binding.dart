import 'package:get/get.dart';

import 'job_controller.dart';

class JobBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobsController>(() => JobsController());
  }
}
