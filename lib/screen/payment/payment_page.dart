import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tmdb_movie_app/payment/film_paid.dart';
import 'package:tmdb_movie_app/widgets/card/credit_card_widget.dart';
import 'package:tmdb_movie_app/widgets/payment/payment_fields.dart';

class PaymentPage extends StatefulWidget {
  final String moviePrice;

  PaymentPage({Key? key, required this.moviePrice}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: CreditCardWidget(),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${widget.moviePrice} €",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  PaymentCardDetailtField(
                    cardText: "CardHolder Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PaymentCardDetailtField(cardText: "Card Number"),
                  SizedBox(
                    height: 10,
                  ),
                  PaymentCardDetailtField(cardText: "CCV"),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedLoadingButton(
                    successColor: Colors.green,
                    child: Text(
                      'Buy Movie',
                      style: TextStyle(color: Colors.white),
                    ),
                    controller: btnController,
                    duration: Duration(seconds: 1),
                    color: Colors.red.shade400.withOpacity(0.7),
                    borderRadius: 6,
                    onPressed: () {
                      paidMovie();
                      setState(() {
                        Timer(Duration(seconds: 4), () {
                          btnController.stop();
                        });
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
