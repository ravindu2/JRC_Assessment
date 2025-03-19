import 'package:get/get.dart';
import 'package:jrc_assement/data/repository/repository_interface.dart';
import 'package:jrc_assement/data/models/job_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobsController extends GetxController {
  final RepositoryInterface repository;
  final selectedFilter = "ACTION".obs;
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
      Get.snackbar(AppLocalizations.of(Get.overlayContext!)!.error,
          AppLocalizations.of(Get.overlayContext!)!.jobs_fails(e));
    }
  }

  Future<void> refreshJobs() async {
    try {
      fetchJobs();
    } catch (e) {
      Get.snackbar(AppLocalizations.of(Get.overlayContext!)!.error,
          'Failed to refresh jobs');
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
