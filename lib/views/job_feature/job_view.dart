import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'job_controller.dart';
import './widgets/job_card.dart';
import './widgets/filter_tabs.dart';
import './widgets/job_count.dart';
import './widgets/bottom_nav_bar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final JobsController controller = Get.put(JobsController());

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
                onFilterTap: () {}, // Implement filter dialog if needed
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
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Jobs',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.blue),
          onPressed: () {},
        ),
      ],
    );
  }
}
