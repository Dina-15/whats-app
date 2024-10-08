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
          flex: 6,
        ),
        Image.asset(
          AssetImages.logo,
          width: 200,
          height: 200,
        ),

        Text("WhatsUp", textAlign: TextAlign.center, style: Styles.textStyle24),
        const Spacer(
          flex: 3,
        ),
        Text(
          "The best chat app for this country",
          style: Styles.textStyle20,
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 5,
        ),
      ],
    );
  }
}
