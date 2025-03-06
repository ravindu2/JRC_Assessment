import 'package:get/get.dart';
import 'package:jrc_assement/routes/app_routes.dart';
import 'package:jrc_assement/views/job_feature/job_binding.dart';
import 'package:jrc_assement/views/job_feature/job_view.dart';
import 'package:jrc_assement/views/login_feature/login_binding.dart';
import 'package:jrc_assement/views/login_feature/login_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.jobs,
      page: () => JobsScreen(),
      binding: JobBinding(),
    ),
  ];
}
