import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Apple MacBook Pro 16' - Silver",
              style: headStyle2,
            ),
            Text(
              "\$3,234.03",
              style: headStyle1,
            ),
          ],
        ),
        kHeight,
        kHeight,
        Text(
          "Apple Store",
          style: headStyle1,
        ),
        kHeight,
        kHeight,
        Text(
          "Return Time Remaining 2 Weeks",
          style: headStyle3,
        ),
        kHeight,
        kHeight,
        Text(
          "1342 Colorado Street, Suite 32 - 92003",
          style: headStyle3,
        ),
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
