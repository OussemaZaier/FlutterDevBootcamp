import 'package:bmi_calculator/calculate.dart';
import 'package:bmi_calculator/screens/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int age = 18;
  int weight = 80;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusable_card(
                    bgColor: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childW: const icon_content(
                      iconD: Icons.male,
                      titleD: 'MALE',
                    ),
                    onTapFct: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: reusable_card(
                    bgColor: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childW: const icon_content(
                      iconD: Icons.female,
                      titleD: 'FEMALE',
                    ),
                    onTapFct: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusable_card(
              bgColor: kActiveCardColour,
              childW: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      min: 120,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
              onTapFct: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusable_card(
                    bgColor: kActiveCardColour,
                    childW: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints(
                                minWidth: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              padding: EdgeInsets.all(15),
                              elevation: 2,
                            ),
                            RawMaterialButton(
                              constraints: BoxConstraints(
                                minWidth: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              padding: EdgeInsets.all(15),
                              elevation: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTapFct: () {},
                  ),
                ),
                Expanded(
                  child: reusable_card(
                    bgColor: kActiveCardColour,
                    childW: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints(
                                minWidth: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              padding: EdgeInsets.all(15),
                              elevation: 2,
                            ),
                            RawMaterialButton(
                              constraints: BoxConstraints(
                                minWidth: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              shape: CircleBorder(),
                              fillColor: Color(0xFF4C4F5E),
                              padding: EdgeInsets.all(15),
                              elevation: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTapFct: () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculate cal = new Calculate(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          cal: cal,
                        )),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              height: kBottomContainerHeight,
              width: double.infinity,
              color: kBottomContainerColour,
            ),
          ),
        ],
      ),
    );
  }
}
