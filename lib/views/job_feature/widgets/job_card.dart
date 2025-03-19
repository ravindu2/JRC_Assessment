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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildLocation(),
            const SizedBox(height: Dimensions.gapsbetweentitle),
            _buildTagsRow(),
            const SizedBox(height: Dimensions.paddingSmall),
            _buildPostDate(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      job.title,
      style: const TextStyle(
        fontSize: Dimensions.fontLarge,
        fontWeight: FontWeight.bold,
        color: AppColors.titleTextColor,
      ),
    );
  }

  Widget _buildLocation() {
    return Text(
      job.location,
      style: TextStyle(
        color: AppColors.locationTextColor,
        fontSize: Dimensions.fontSmall,
      ),
    );
  }

  Widget _buildTagsRow() {
    return Row(
      children: [
        _buildJobNumberTag(),
        const SizedBox(width: Dimensions.paddingSmall),
        _buildTenantPostedTag(),
        const SizedBox(width: Dimensions.paddingSmall),
        _buildCategoryTag(),
        const Spacer(),
        if (job.isUrgent == 1) _buildUrgentTag(),
      ],
    );
  }

  Widget _buildJobNumberTag() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmall,
        vertical: Dimensions.paddingSmall / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.jobIdColor,
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: Text(
        '#${job.jobNumber}',
        style: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSmallJob,
        ),
      ),
    );
  }

  Widget _buildTenantPostedTag() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmall,
        vertical: Dimensions.paddingSmall / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.textColor,
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: Text(
        job.postedBy,
        style: TextStyle(
          color: AppColors.statusBackgroundColor,
          fontSize: Dimensions.fontSmallJob,
        ),
      ),
    );
  }

  Widget _buildCategoryTag() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmall,
        vertical: Dimensions.paddingSmall / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: Text(
        job.category,
        style: const TextStyle(
          fontSize: Dimensions.fontSmallJob,
          color: Colors.black54,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildUrgentTag() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmall,
        vertical: Dimensions.paddingSmall / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.urgentBackgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: Text(
        'Urgently',
        style: TextStyle(
          color: AppColors.urgentTextColour,
          fontSize: Dimensions.fontSmallJob,
          fontFamily: 'AvenirNext',
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPostDate() {
    return Text(
      'Posted on ${_formatDate(job.postDate)}',
      style: TextStyle(
        color: AppColors.postDateTextColor,
        fontSize: Dimensions.fontSmall,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
