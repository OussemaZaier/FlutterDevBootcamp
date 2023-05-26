import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/resultScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: const SliderThemeData().copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: const Color(0xFF8D8E98),
            thumbColor: const Color(0xFFEB1555),
            overlayColor: const Color(0x29EB1555),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)),
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
