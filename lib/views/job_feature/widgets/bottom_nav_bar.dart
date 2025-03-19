import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jrc_assement/themes/themes.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.textColor,
      items: [
        BottomNavigationBarItem(
          icon:
              SvgPicture.asset('assets/image/jobs.svg', width: 24, height: 24),
          label: AppLocalizations.of(context)!.jobs,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/image/inspections.svg',
              width: 24, height: 24),
          label: AppLocalizations.of(context)!.inspections,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/image/chat.svg',
            width: 24,
            height: 24,
          ),
          label: AppLocalizations.of(context)!.chat,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/image/notification.svg',
              width: 24, height: 24),
          label: AppLocalizations.of(context)!.more,
        ),
        BottomNavigationBarItem(
          icon:
              SvgPicture.asset('assets/image/more.svg', width: 20, height: 14),
          label: 'More',
        ),
      ],
      currentIndex: 0,
    );
  }
}
