import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomProgress extends StatefulWidget {
  final double perogress;

  CustomProgress({Key? key, required this.perogress}) : super(key: key);

  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  double value = 0.0;
  @override
  void initState() {
    super.initState();
    setState(() {
      value = widget.perogress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            size: 100,
            customWidths: CustomSliderWidths(
              progressBarWidth: 5,
            ),
          ),
          min: 0,
          max: 100,
          initialValue: value,
          onChange: (tap) {
            setState(() {
              value = tap;
              print(value);
            });
          },
        ),
      ),
    );
  }
}
