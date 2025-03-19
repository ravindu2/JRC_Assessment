import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/image/logo.svg',
        height: 36,
        width: 202,
      ),
    );
  }
}
