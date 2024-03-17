import 'package:flutter_svg/flutter_svg.dart';

const String imagePath = "assets/images";
const String svgPath = "assets/svg";

class AppImages {
  //? PNG Paths
  static String placeholderImg = "https://picsum.photos/200";
  // static String placeholder200 = "https://placehold.co/200";
  static String placeholder = "https://via.placeholder.com/";
  static String appLogo = "$imagePath/logo_round.png";
  static String boyImg = "$imagePath/boy.png";

  //? SVG Paths
  static String wifiSvg = "$svgPath/wifi.svg";
  static String appLogoSvg = "$svgPath/app_logo.svg";
  static String settingsSvg = "$svgPath/settings.svg";
  static String bagSvg = "$svgPath/bag.svg";
}

Future<void> svgPreloader() async {
  await preloadSVGs([
    AppImages.wifiSvg,
    AppImages.appLogoSvg,
    AppImages.settingsSvg,
    AppImages.bagSvg,
  ]);
}

Future<void> preloadSVGs(List<String> assetPaths) async {
  for (final path in assetPaths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
}
