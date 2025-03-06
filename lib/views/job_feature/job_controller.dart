import 'package:get/get.dart';
import '../../data/models/job_model.dart';
import '../../data/remote_data_source/job_remote_data_source.dart';
import '../../data/services/api_service.dart';

class JobsController extends GetxController {
  final JobRemoteDataSource _jobRemoteDataSource =
      JobRemoteDataSource(ApiService());
  var selectedFilter = "ACTION".obs;
  final List<String> filters = ["ACTION", "FOLLOW UP", "REVIEW"];
  var jobs = <JobModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
  }

  void fetchJobs() async {
    try {
      final String userId = Get.arguments['userId'];
      final jobList = await _jobRemoteDataSource.getJobList(userId);
      jobs.assignAll(jobList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load jobs: $e');
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
