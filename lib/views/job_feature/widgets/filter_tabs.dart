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
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.spaceSmall,
          vertical: Dimensions.borderRadiusMedium),
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.spaceSmall),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: filters.map((filter) {
          bool isSelected = selectedFilter == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () => onFilterChanged(filter),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  filter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
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
