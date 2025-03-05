import 'package:flutter/material.dart';
import '../../../models/job_model.dart';
import '../../../themes/themes.dart';

class JobCard extends StatelessWidget {
  final JobModel job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  job.id,
                  style: TextStyle(
                    color: AppColors.jobIdColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.statusBackgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    job.status,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.statusTextColor,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  job.category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.categoryTextColor,
                  ),
                ),
                if (job.isUrgent) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.urgentBackgroundColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Urgently',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.urgentTextColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            Text(
              job.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.titleTextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              job.location,
              style: TextStyle(
                color: AppColors.locationTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Posted on ${job.postDate}',
              style: TextStyle(
                color: AppColors.postDateTextColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
