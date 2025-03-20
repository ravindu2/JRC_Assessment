import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jrc_assement/gen/assets.gen.dart';
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
          icon: SvgPicture.asset(Assets.image.jobs,
              width: Dimensions.iconsizemedium,
              height: Dimensions.iconsizemedium),
          label: AppLocalizations.of(context)!.jobs,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.image.inspections,
              width: Dimensions.iconsizemedium,
              height: Dimensions.iconsizemedium),
          label: AppLocalizations.of(context)!.inspections,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.image.chat,
            width: Dimensions.iconsizemedium,
            height: Dimensions.iconsizemedium,
          ),
          label: AppLocalizations.of(context)!.chat,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.image.notification,
              width: Dimensions.iconsizemedium,
              height: Dimensions.iconsizemedium),
          label: AppLocalizations.of(context)!.notifications,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Assets.image.more,
              width: Dimensions.iconsizesmall, height: Dimensions.marginSmall),
          label: AppLocalizations.of(context)!.more,
        ),
      ],
      currentIndex: 0,
    );
  }
}
