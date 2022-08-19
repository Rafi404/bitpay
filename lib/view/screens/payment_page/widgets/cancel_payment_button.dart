import 'package:flutter/material.dart';

class CancelPaymentButton extends StatelessWidget {
  const CancelPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // elevation: 15.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Cancel Payment',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
