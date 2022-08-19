import 'package:bitpay/view/constants/colors.dart';
import 'package:flutter/material.dart';

class ShimmerBar extends StatelessWidget {
  final double shimmerHeight;
  final double shimmerWidth;
  const ShimmerBar({Key? key, required this.shimmerHeight, required this.shimmerWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shimmerHeight,
      width: shimmerWidth,
      color: bottomNavUnSelectedColor,
    );
  }
}
