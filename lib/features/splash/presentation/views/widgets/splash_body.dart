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
        const Spacer(flex: 2,),
        Image.asset(AssetImages.logo, width: 100, height: 120,),
        const SizedBox(height: 20,),
        Text("WhatsApp", style: Styles.textStyle24,
          textAlign: TextAlign.center,),
        const Spacer(flex: 2,),
        const Text("from",textAlign: TextAlign.center,),
        Text("Meta", style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w400 ),
          textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
      ],
    );
  }
}
