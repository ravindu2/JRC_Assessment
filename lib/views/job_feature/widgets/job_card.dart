import 'package:flutter/material.dart';
import '../../../data/models/job_model.dart';
import '../../../themes/themes.dart';

class JobCard extends StatelessWidget {
  final JobModel job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.marginMedium,
        vertical: Dimens.marginSmall,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.borderRadiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              job.title,
              style: const TextStyle(
                fontSize: Dimens.fontLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.titleTextColor,
              ),
            ),
            const SizedBox(height: Dimens.paddingSmall),
            // Location
            Text(
              job.location,
              style: TextStyle(
                color: AppColors.locationTextColor,
                fontSize: Dimens.fontMedium,
              ),
            ),
            const SizedBox(height: Dimens.paddingLarge),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.paddingSmall,
                    vertical: Dimens.paddingSmall / 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.jobIdColor.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(Dimens.borderRadiusSmall),
                  ),
                  child: Text(
                    '#${job.jobNumber}',
                    style: TextStyle(
                      color: AppColors.jobIdColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.fontSmall,
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.paddingSmall),
                // Status (Tenant posted)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.paddingSmall,
                    vertical: Dimens.paddingSmall / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.circular(Dimens.borderRadiusSmall),
                  ),
                  child: const Text(
                    'Tenant posted',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.fontSmall,
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.paddingSmall),
                // Category (Electrician: Powerpoint)
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.paddingSmall,
                      vertical: Dimens.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          BorderRadius.circular(Dimens.borderRadiusSmall),
                    ),
                    child: Text(
                      job.category,
                      style: const TextStyle(
                        fontSize: Dimens.fontSmall,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const Spacer(),
                if (job.isUrgent)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.paddingSmall,
                      vertical: Dimens.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius:
                          BorderRadius.circular(Dimens.borderRadiusSmall),
                    ),
                    child: const Text(
                      'URGENT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.fontSmall,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Dimens.paddingSmall),
            // Posted Date
            Text(
              'Posted on ${job.postDate}',
              style: TextStyle(
                color: AppColors.postDateTextColor,
                fontSize: Dimens.fontSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
