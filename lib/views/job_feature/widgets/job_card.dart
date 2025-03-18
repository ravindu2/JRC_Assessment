import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jrc_assement/data/models/job_model.dart';
import 'package:jrc_assement/themes/themes.dart';

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
        horizontal: Dimensions.marginMedium,
        vertical: Dimensions.marginSmall,
      ),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: const TextStyle(
                fontSize: Dimensions.fontLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.titleTextColor,
              ),
            ),
            Text(
              job.location,
              style: TextStyle(
                color: AppColors.locationTextColor,
                fontSize: Dimensions.fontMedium,
              ),
            ),
            const SizedBox(height: Dimensions.gapsbetweentitle),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSmall,
                    vertical: Dimensions.paddingSmall / 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.jobIdColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadiusSmall),
                  ),
                  child: Text(
                    '#${job.jobNumber}',
                    style: TextStyle(
                      color: AppColors.statusTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSmallJob,
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSmall),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSmall,
                    vertical: Dimensions.paddingSmall / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadiusSmall),
                  ),
                  child: const Text(
                    'Tenant posted',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.fontSmallJob,
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSmall),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSmall,
                    vertical: Dimensions.paddingSmall / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadiusSmall),
                  ),
                  child: Text(
                    job.category,
                    style: const TextStyle(
                      fontSize: Dimensions.fontSmallJob,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                if (true)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSmall,
                      vertical: Dimensions.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400.withOpacity(0.25),
                      borderRadius:
                          BorderRadius.circular(Dimensions.borderRadiusSmall),
                    ),
                    child: Text(
                      'Urgently', // Matching SwiftUI text
                      style: TextStyle(
                        color: Color.fromRGBO(222, 76, 57, 1),
                        fontSize: 10.0,
                        fontFamily: 'AvenirNext-DemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSmall),
            Text(
              'Posted on ${_formatDate(job.postDate)}',
              style: TextStyle(
                color: AppColors.postDateTextColor,
                fontSize: Dimensions.fontSmall,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
