import 'package:get/get.dart';
import '../../models/job_model.dart';

class JobsController extends GetxController {
  var selectedFilter = "ACTION".obs;
  final List<String> filters = ["ACTION", "FOLLOW UP", "REVIEW"];
  var jobs = <JobModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadJobs();
  }

  void loadJobs() {
    jobs.value = [
      JobModel(
        id: "20513917758",
        title: "Need to fix damaged powerpoint",
        location: "NSW Coastline Cycleway, Bulli NSW, Australia",
        category: "Electrician / Powerpoint",
        status: "Recently posted",
        isUrgent: false,
        postDate: "26 Nov 2020",
        quoteAvailable: false,
      ),
      JobModel(
        id: "20513917758",
        title: "Need to fix damaged powerpoint",
        location: "NSW Coastline Cycleway, Bulli NSW, Australia",
        category: "Electrician / Powerpoint",
        status: "Quote available",
        isUrgent: true,
        postDate: "26 Nov 2020",
        quoteAvailable: true,
      ),
    ];
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}
