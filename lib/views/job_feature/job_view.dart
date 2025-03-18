import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/themes/themes.dart';
import 'package:jrc_assement/views/job_feature/job_controller.dart';
import 'package:jrc_assement/views/job_feature/widgets/job_card.dart';
import 'package:jrc_assement/views/job_feature/widgets/filter_tabs.dart';
import 'package:jrc_assement/views/job_feature/widgets/job_count.dart';
import './widgets/bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final JobsController controller = Get.find();

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Obx(() => FilterTabs(
                filters: controller.filters,
                selectedFilter: controller.selectedFilter.value,
                onFilterChanged: controller.changeFilter,
              )),
          Obx(() => JobCount(
                count: controller.jobs.length,
                onFilterTap: () {},
              )),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.jobs.length,
                  itemBuilder: (context, index) {
                    return JobCard(job: controller.jobs[index]);
                  },
                )),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text(
        'Jobs',
        style: TextStyle(color: AppColors.textColor),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(Dimens.borderRadiusMedium),
            height: Dimens.iconSize,
            width: Dimens.iconSize,
            decoration: BoxDecoration(
              color: AppColors.iconContainerColor,
              borderRadius: BorderRadius.circular(Dimens.iconBoarderRadius),
            ),
            child: Center(
                child: const Icon(
              Icons.search,
              color: Colors.black,
              size: 19,
            )),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(Dimens.borderRadiusMedium),
            height: Dimens.iconSize,
            width: Dimens.iconSize,
            decoration: BoxDecoration(
              color: AppColors.iconContainerColor,
              borderRadius: BorderRadius.circular(Dimens.iconBoarderRadius),
            ),
            child: SvgPicture.asset(
              'assets/icon_people.svg',
              width: 23,
              height: 23,
              colorFilter:
                  const ColorFilter.mode(AppColors.textColor, BlendMode.srcIn),
            ),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add_circle, color: AppColors.primaryColor),
          iconSize: Dimens.iconSize,
          onPressed: () {},
        ),
      ],
    );
  }
}
