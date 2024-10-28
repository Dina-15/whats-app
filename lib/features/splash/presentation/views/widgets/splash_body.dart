import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoracademyproject/core/helpers/spacing.dart';
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
          width: 100.w,
          height: 100.h,
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
              height: 30.h,
              width: 30.w,
            ),
            Text(
              "Meta",
              style: AppStyles.font24Green.copyWith( fontFamily: AssetFonts.metaFont),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        verticalSpace(20),
      ],
    );
  }
}