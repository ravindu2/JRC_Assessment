import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jrc_assement/gen/assets.gen.dart';
import 'package:jrc_assement/themes/themes.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.image.logo,
        height: Dimensions.logoHsize,
        width: Dimensions.logoWsize,
      ),
    );
  }
}
