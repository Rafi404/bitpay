import 'package:bitpay/model/activity_model.dart';
import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  Map<String, dynamic>? activityData;
  Activity({Key? key,this.activityData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              activityData!["title"].toString(),
              style: headStyle2,
            ),
            Text(
              "\$ + ${activityData!["amount"].toString()}",
              style: headStyle1,
            ),
          ],
        ),
        kHeight,
        kHeight,
        Text(
          activityData!["head"].toString(),
          style: headStyle1,
        ),
        kHeight,
        kHeight,
        Text(
          activityData!["description"].toString(),
          style: headStyle3,
        ),
        kHeight,
        kHeight,
        Text(
          activityData!["address"].toString(),
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
