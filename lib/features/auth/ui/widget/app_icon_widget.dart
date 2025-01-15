import 'package:ecommerce/app/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key, this.width, this.height, this.boxFit});
  final double? width;
  final double? height;
  final double? boxFit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogoSvg,
      width:width ?? 120,
      height: height ?? 120,
      fit: BoxFit.scaleDown,

    );
  }
}
