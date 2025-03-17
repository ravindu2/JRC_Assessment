import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/job_model.dart';
import '../../../themes/themes.dart';

class JobCard extends StatelessWidget {
  final JobModel job;

  const JobCard({super.key, required this.job});

  String _formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

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
            Text(
              job.title,
              style: const TextStyle(
                fontSize: Dimens.fontLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.titleTextColor,
              ),
            ),
            Text(
              job.location,
              style: TextStyle(
                color: AppColors.locationTextColor,
                fontSize: Dimens.fontMedium,
              ),
            ),
            const SizedBox(height: Dimens.gapsbetweentitle),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.paddingSmall,
                    vertical: Dimens.paddingSmall / 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.jobIdColor,
                    borderRadius:
                        BorderRadius.circular(Dimens.borderRadiusSmall),
                  ),
                  child: Text(
                    '#${job.jobNumber}',
                    style: TextStyle(
                      color: AppColors.statusTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.fontSmallJob,
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.paddingSmall),
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
                      fontSize: Dimens.fontSmallJob,
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.paddingSmall),
                Container(
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
                      fontSize: Dimens.fontSmallJob,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
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
                        fontSize: Dimens.fontSmallJob,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Dimens.paddingSmall),
            Text(
              'Posted on ${_formatDate(job.postDate)}',
              style: TextStyle(
                color: AppColors.postDateTextColor,
                fontSize: Dimens.fontSmall,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
