import 'package:flutter/cupertino.dart';

class ImagePlaceHolder extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backGroundColor;
  final EdgeInsets? padding;

  const ImagePlaceHolder({
    Key? key,
    this.width,
    this.height,
    this.backGroundColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      color: backGroundColor,
      height: height,
      child: const Center(
        child: Image(
          image: AssetImage('assets/icons/png/donation.png'),
        ),
      ),
    );
  }
}
