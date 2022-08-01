import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/payment/film_paid.dart';
import 'package:tmdb_movie_app/screen/payment/payment_page.dart';

class BuyFilmWidget extends StatefulWidget {
  @override
  _BuyFilmWidgetState createState() => _BuyFilmWidgetState();
}

class _BuyFilmWidgetState extends State<BuyFilmWidget> {
  Random random = new Random();
  String toSal = "";
  String salaryV() {
    double? filmSalary =
        moviePaidRandomGenerator(random.nextInt(random.nextInt(220)));
    return filmSalary.toString();
  }

  @override
  void initState() {
    super.initState();
    toSal = salaryV();
  }

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
                salaryV(),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    moviePrice: salaryV(),
                  ),
                ),
              );
            },
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
