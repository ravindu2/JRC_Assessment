import 'package:get/get.dart';
import 'package:jrc_assement/data/local_data_source/job_localdata_source.dart';
import 'package:jrc_assement/data/repository/job_repository.dart';
import '../../data/models/job_model.dart';
import '../../data/remote_data_source/job_remote_data_source.dart';
import '../../data/services/api_service.dart';

class JobsController extends GetxController {
  final JobRepository repository = JobRepository(
      localDataSource: JobLocalDataSource(),
      remoteDataSource: JobRemoteDataSource(ApiService()));
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
      final jobList = await repository.getJobs(userId);
      print(Get.arguments['userId']);
      jobs.assignAll(jobList);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load jobs: $e');
      print(e);
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
