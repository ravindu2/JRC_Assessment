import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing $count jobs',
            style:
                TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: Row(
              children: [
                Icon(Icons.flash_on_outlined,
                    color: Colors.blue[300], size: 20),
                const SizedBox(width: 4),
                Text(
                  'Filter',
                  style: TextStyle(color: Colors.blue[300]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
