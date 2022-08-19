import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/avatar.dart';
import 'package:bitpay/view/screens/payment_page/widgets/cancel_payment_button.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  Map<String, dynamic>? contacts;
  PaymentPage({Key? key,this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomNavSelectedColor,
      body: Stack(
        fit: StackFit.loose,
        children: [
        Align(
        alignment: Alignment.center,
        child: Transform.scale(
          scale: 1.1,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: circleRound1Color, borderRadius: BorderRadius.circular(200)),
          ),
        ),
      ),

          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 0.7,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: circleRound2Color, borderRadius: BorderRadius.circular(200)),
              ),
            ),
          ),

          Align(
              alignment: Alignment.center,
              child: Hero(
                  tag: "avatar",
                  child: Avatar(avatarWidth: 100, avatarHeight: 100, avatarImage: contacts!["profileImage"],))),

    Positioned(
      top: 630,
      left: 80,
      child: Column(
        children: [
          Text('Paying',style: TextStyle(
            fontSize: 18,
            color: Colors.white,

          ),),
          kHeight,
          kHeight,
          Text('${contacts!["firstname"]} ' '${contacts!["lastname"]}' ,style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold

          ),),
          kMinHeight,
          CancelPaymentButton(),


        ],
      ),
    ),
        ],
      ),
    );
  }
}
