import 'package:bitpay/view/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({Key? key,required this.avatarHeight, required this.avatarWidth,required this.avatarImage}) : super(key: key);

  double avatarHeight;
  double avatarWidth;
  String avatarImage;

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: avatarWidth,
      height: avatarHeight,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(avatarImage.toString()),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all( Radius.circular(50.0)),
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
      ),
    );
  }
}
