import 'package:flutter/material.dart';
import 'package:jrc_assement/themes/themes.dart';

class JobCount extends StatelessWidget {
  final int count;
  final VoidCallback onFilterTap;

  const JobCount({
    super.key,
    required this.count,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.spaceSmall,
          vertical: Dimensions.borderRadiusSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing $count jobs',
            style: TextStyle(
                color: AppColors.disabledButtonColor,
                fontStyle: FontStyle.italic),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: Row(
              children: [
                Icon(
                  Icons.flash_on_outlined,
                  color: AppColors.primaryColor,
                  size: Dimensions.iconsizesmall,
                ),
                const SizedBox(width: 4),
                Text(
                  'Filter',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
