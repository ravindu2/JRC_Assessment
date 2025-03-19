import 'package:flutter/material.dart';
import 'package:jrc_assement/themes/themes.dart';

class FilterTabs extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const FilterTabs({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.spaceSmall),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(Dimensions.iconBoarderRadius),
      ),
      child: Row(
        children: filters.map((filter) {
          bool isSelected = selectedFilter == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () => onFilterChanged(filter),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSmall),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(Dimensions.iconBoarderRadius),
                ),
                child: Text(
                  filter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'AvenirNext',
                    fontSize: Dimensions.fontSmall,
                    color: isSelected
                        ? AppColors.buttonTextColor
                        : AppColors.textColor,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
