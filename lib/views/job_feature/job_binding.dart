import 'package:get/get.dart';
import '../../data/repository/repository_interface.dart';

import 'job_controller.dart';

class JobBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobsController>(() => JobsController(
          repository: Get.find<RepositoryInterface>(),
        ));
  }
}
