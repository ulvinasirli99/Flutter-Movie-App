import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade400.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 400,
      height: 200,
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(
                -0.73,
                -0.9,
              ),
              child: Text(
                "Visa Gold",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment(
                -0.81,
                -0.33,
              ),
              child: Image.network(
                "https://previews.123rf.com/images/martialred/martialred1811/martialred181100026/113393157-gold-credit-or-debit-charge-card-emv-chip-flat-vector-icon-for-apps-and-websites.jpg",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            Align(
              alignment: Alignment(
                -0.5,
                0.3,
              ),
              child: Text(
                "4226 6997 8025 9601",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment(
                0.6,
                0.73,
              ),
              child: Text(
                "05/24",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Align(
              alignment: Alignment(
                -0.74,
                0.71,
              ),
              child: Text(
                "Brooklyn Hernandez",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment(
                0.46,
                -0.36,
              ),
              child: Text(
                "Credit Card",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
