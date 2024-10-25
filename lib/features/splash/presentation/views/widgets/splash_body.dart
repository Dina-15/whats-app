import 'package:flutter/material.dart';
import 'package:mentoracademyproject/core/utils/constants/asset_fonts.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/constants/app_assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          AppAssets.logo,
          width: 100,
          height: 100,
        ),
        const Spacer(
          flex: 2,
        ),
        const Text(
          "from",
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.metaIcon,
              height: 30,
              width: 30,
            ),
            Text(
              "Meta",
              style: AppStyles.font24Green.copyWith( fontFamily: AssetFonts.metaFont),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}