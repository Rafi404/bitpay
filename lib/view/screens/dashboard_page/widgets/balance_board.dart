import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:flutter/material.dart';

class BalanceBoard extends StatelessWidget {
  const BalanceBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: bottomNavBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "\$204.05",
                  style: headStyle4,
                ),
                kHeight,
                Text("Your Balance",style: headStyle3,),
              ],
            ),
            VerticalDivider(
              color: bottomNavUnSelectedColor,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text("30",  style: headStyle5,),
                    Icon(Icons.arrow_drop_down,color: bottomNavSelectedColor,)
                  ],
                ),
                kHeight,
                Text("Last Days", style: headStyle3,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
