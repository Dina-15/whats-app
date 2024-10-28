mixin PngAssets {
  static const String pngAssets = "assets/images/";
}

mixin SvgAssets {
  static const String svgAssets = "assets/svg/";
}

mixin VideoAssets {
  static const String videoAssets = "assets/animation/";
}

class AppAssets with PngAssets, SvgAssets, VideoAssets {
  // Image PNG
  static const logo = "${PngAssets.pngAssets}whatsappLogo.png";
  static const metaIcon = "${PngAssets.pngAssets}meta icon.png";
  static const profileImage = "${PngAssets.pngAssets}profile.png";
}