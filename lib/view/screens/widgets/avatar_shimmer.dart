import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:flutter/material.dart';

import 'shimmer_bar.dart';

class AvatarShimmer extends StatelessWidget {
  const AvatarShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        AvatarShimmerChild(),
        AvatarShimmerChild(),
        AvatarShimmerChild(),
        AvatarShimmerChild(),
        AvatarShimmerChild(),
        AvatarShimmerChild(),
      ],
    );
  }
}

class AvatarShimmerChild extends StatelessWidget {
  const AvatarShimmerChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        kMinWidth,
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: bottomNavUnSelectedColor,
            borderRadius: BorderRadius.all( Radius.circular(50.0)),
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
          ),
        ),
        kHeight,
        kHeight,
        ShimmerBar(shimmerHeight: 10,shimmerWidth: 25,),
        kHeight,
        kHeight,
        ShimmerBar(shimmerHeight: 10,shimmerWidth: 35,),


      ],
    );
  }
}

