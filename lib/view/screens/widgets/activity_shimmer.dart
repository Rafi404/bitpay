import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/screens/widgets/shimmer_bar.dart';
import 'package:flutter/material.dart';

class ActivityShimmer extends StatelessWidget {
  const ActivityShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityShimmerChild(),
        ActivityShimmerChild(),
        ActivityShimmerChild(),
      ],
    );
  }
}

class ActivityShimmerChild extends StatelessWidget {
  const ActivityShimmerChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerBar(shimmerHeight: 15, shimmerWidth: 150),
            ShimmerBar(shimmerHeight: 15, shimmerWidth: 40),

          ],
        ),
        kHeight,
        kHeight,
        ShimmerBar(shimmerHeight: 25, shimmerWidth: 100),

        kHeight,
        kHeight,
        ShimmerBar(shimmerHeight: 15, shimmerWidth: 180),

        kHeight,
        kHeight,
        ShimmerBar(shimmerHeight: 15, shimmerWidth: 200),

        kHeight,
        kHeight,
        Divider(
          color: bottomNavUnSelectedColor,
        ),
        kHeight,
      ],
    );
  }
}
