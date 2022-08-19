import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:bitpay/view/screens/payment_page/payment_page.dart';
import 'package:flutter/material.dart';

class NameAvatar extends StatelessWidget {
  Map<String, dynamic>? contacts;
  NameAvatar({Key? key, this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PaymentPage(
            contacts: contacts,
          );
        }));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kMinWidth,
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: NetworkImage(contacts!["profileImage"].toString()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
          ),
          kHeight,
          kHeight,
          Text(
            '${contacts!["firstname"].toString()}\n ${contacts!["lastname"].toString()}',
            textAlign: TextAlign.center,
            style: headStyle3,
          )
        ],
      ),
    );
  }
}
