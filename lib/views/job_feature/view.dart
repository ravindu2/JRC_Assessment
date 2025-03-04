import 'package:flutter/material.dart';
import '../../models/job_model.dart';
import './widgets/job_card.dart';
import './widgets/filter_tabs.dart';
import './widgets/job_count.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  String _selectedFilter = "ACTION";
  final List<String> _filters = ["ACTION", "FOLLOW UP", "REVIEW"];
  final List<JobModel> _jobs = [
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
    JobModel(
      id: "20513917758",
      title: "Need to fix damaged powerpoint",
      location: "NSW Coastline Cycleway, Bulli NSW, Australia",
      category: "Electrician / Powerpoint",
      status: "Ready posted",
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

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  void _onFilterTap() {
    // Implement filter dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Jobs',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
      ),
      body: Column(
        children: [
          FilterTabs(
            filters: _filters,
            selectedFilter: _selectedFilter,
            onFilterChanged: _onFilterChanged,
          ),
          JobCount(
            count: _jobs.length,
            onFilterTap: _onFilterTap,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _jobs.length,
              itemBuilder: (context, index) {
                return JobCard(job: _jobs[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart_outlined),
          label: 'Inspections',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'More',
        ),
      ],
      currentIndex: 0,
    );
  }
}