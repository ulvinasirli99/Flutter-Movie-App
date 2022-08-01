import 'package:flutter/material.dart';

class PaymentCardDetailtField extends StatelessWidget {
  final String? cardText;

  PaymentCardDetailtField({Key? key, this.cardText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
        margin: EdgeInsets.only(left: 12, right: 12),
        width: size.width,
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: cardText,
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
