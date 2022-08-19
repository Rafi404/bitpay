import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ActivityHead extends StatelessWidget {
  const ActivityHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Your Activity',style: headStyle1,),
        Icon(Icons.sort,color: bottomNavSelectedColor,)
      ],
    );
  }
}
