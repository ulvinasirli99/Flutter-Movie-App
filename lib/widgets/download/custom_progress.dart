import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomProgress extends StatelessWidget {
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
          initialValue: 54,
        ),
      ),
    );
  }
}
