import "package:flutter/services.dart";
import 'resuilts_page.dart';
import 'calc_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseableCard.dart';
import 'iconDetails.dart';
import 'constans.dart';
import 'buttom_button.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(BMIcalc());
}

//BMI Calculator
class BMIcalc extends StatefulWidget {
  @override
  _BMIcalcState createState() => _BMIcalcState();
}

class _BMIcalcState extends State<BMIcalc> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        routes: {'/result': (context) => ResultPage()},
        theme: ThemeData.dark(),
        home: CalcMain());
  }
}

class CalcMain extends StatefulWidget {
  @override
  _CalcMainState createState() => _CalcMainState();
}

class _CalcMainState extends State<CalcMain> {
  Gender selectedGender;
  String warningText = 'Select Gender';
  int height = 160;
  int weight = 45;
  int age = 20;

  playSound(int soundId) {
    final AudioCache player = AudioCache();
    player.play('tap$soundId.mp3');
  }

  toFeet(int cm) {
    double feet = cm / 2.54;
    feet = feet / 12;
    return feet.toStringAsFixed(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: ReuseableCard(
              onPress: () {
                setState(() {
                  playSound(1);
                  selectedGender = Gender.male;
                });
              },
              colour: selectedGender == Gender.male
                  ? kactiveButtonColor
                  : kinActiveButtonColor,
              cardChild: IconDetails(
                icon: FontAwesomeIcons.male,
                genderLabel: 'Male',
                iconColor:
                    selectedGender == Gender.male ? Colors.cyan : Colors.grey,
              ),
            )),
            Expanded(
                child: ReuseableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                  playSound(1);
                });
              },
              colour: selectedGender == Gender.female
                  ? kactiveButtonColor
                  : kinActiveButtonColor,
              cardChild: IconDetails(
                icon: FontAwesomeIcons.female,
                genderLabel: 'Female',
                iconColor:
                    selectedGender == Gender.female ? Colors.cyan : Colors.grey,
              ),
            )),
          ],
        )),
        Expanded(
            child: ReuseableCard(
          colour: kwidgetColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: klabelText,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kboldText,
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text('CM', style: klabelText)
                  ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    toFeet(height),
                    style: kboldText,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Feet',
                    style: klabelText,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Colors.cyan,
                  overlayColor: Color(0x50FFFFFF),
                  activeTickMarkColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                      pressedElevation: 10,
                      elevation: 5),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                  trackHeight: 2,
                  disabledThumbColor: Colors.grey,
                ),
                child: Slider(
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  value: height.toDouble(),
                  min: 120.0,
                  max: 300.0,
                  inactiveColor: Colors.grey,
                ),
              )
            ],
          ),
        )),
        Expanded(
          child: Row(
            children: [
              // Expanded(
              //   child: Container(
              //     child: Image.asset('images/king$height.gif'),
              //   ),
              // ),
              Expanded(
                  child: ReuseableCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: klabelText,
                    ),
                    Text(
                      weight.toString(),
                      style: kboldText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RoundedButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight <= 10 ? weight = 10 : weight--;
                              playSound(1);
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                              playSound(1);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                colour: kwidgetColor,
              )),

              Expanded(
                  child: ReuseableCard(
                colour: kwidgetColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: klabelText,
                    ),
                    Text(
                      age.toString(),
                      style: kboldText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RoundedButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age > 20 ? age-- : age = 20;
                              playSound(1);
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                              playSound(1);
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        BottomButton(
            onPressed: () {
              playSound(1);
              if (selectedGender != null) {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiCalc: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      suggestionText: calc.getInterpretation(),
                    ),
                  ),
                );
              }
            },
            buttonName: selectedGender == null ? warningText : 'Calculate')
      ]),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundedButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onLongPress: onPressed,
      onPressed: onPressed,
      child: Icon(icon),
      splashColor: Colors.white,
      shape: CircleBorder(),
      fillColor: Colors.grey,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
    );
  }
}
