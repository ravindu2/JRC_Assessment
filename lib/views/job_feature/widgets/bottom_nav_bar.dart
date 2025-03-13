import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_today),
          label: AppLocalizations.of(context)!.jobs,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart_outlined),
          label: AppLocalizations.of(context)!.inspections,
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: AppLocalizations.of(context)!.chat),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: AppLocalizations.of(context)!.more),
        const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
      ],
      currentIndex: 0,
    );
  }
}
