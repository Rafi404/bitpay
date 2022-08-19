import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  SettingsTile({Key? key,required this.tileIcon, required this.tileTitle}) : super(key: key);

 final IconData tileIcon;
 final String tileTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:  Icon(tileIcon),
          title: Text(tileTitle,style: headStyle2,),
          trailing: Icon(Icons.arrow_forward_ios_sharp,color: bottomNavSelectedColor,),
        ),

        Divider(
        color: bottomNavUnSelectedColor,
        ),
      ],
    );
  }
}
