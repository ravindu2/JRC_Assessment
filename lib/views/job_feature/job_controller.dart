import 'package:get/get.dart';
import 'package:jrc_assement/data/repository/repository_interface.dart';
import 'package:jrc_assement/data/models/job_model.dart';

class JobsController extends GetxController {
  final RepositoryInterface repository;
  var selectedFilter = "ACTION".obs;
  final List<String> filters = ["ACTION", "FOLLOW UP", "REVIEW"];
  var jobs = <JobModel>[].obs;

  JobsController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
  }

  void fetchJobs() async {
    final String userId = Get.arguments['userId'];

    try {
      final jobList = await repository.getJobs(userId);
      jobs.assignAll(jobList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load jobs: $e');
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
