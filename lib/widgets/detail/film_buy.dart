import 'package:flutter/material.dart';

class BuyFilmWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                "€",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "6.6",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.green.shade600),
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "BUY NOW",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        )
      ],
    );
  }
}
