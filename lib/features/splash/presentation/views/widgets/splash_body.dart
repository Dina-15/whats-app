import 'package:flutter/material.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../../core/utils/constants/asset_images.dart';

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
          AssetImages.logo,
          width: 100,
          height: 100,
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          "WhatsUp",
          textAlign: TextAlign.center,
          style: Styles.textStyle24
        ),
            Text(
              "The best chat app for this country",
              style: Styles.textStyle15,
              textAlign: TextAlign.center,
            ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
