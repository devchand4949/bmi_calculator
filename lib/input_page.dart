import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'fun-widget.dart';
import 'output-page.dart';
import 'calculateBmi.dart';
import 'bottom-button.dart';
import 'reusablecard.dart';

enum Gender { male, femal }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int currentheight = 180;
  int currentweight = 60;
  int currentage = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
        backgroundColor: const Color(0XFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                // male
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        print("male");
                        selectedGender = Gender.male;
                      });
                    },
                    child: Reusablecard(
                      colour: selectedGender == Gender.male
                          ? activecolor
                          : inactivecolor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                // female
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        print('female');
                        selectedGender = Gender.femal;
                      });
                    },
                    child: Reusablecard(
                      colour: selectedGender == Gender.femal
                          ? activecolor
                          : inactivecolor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // -------------------height--------------------
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                inactivecolor == inactivecolor ? inactivecolor : activecolor;
              });
            },
            child: Reusablecard(
                colour: activecolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerTitile(title: 'HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        input(text: currentheight),
                        Text(
                          'cm',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          value: currentheight.toDouble(),
                          min: 120,
                          max: 250,
                          activeColor: inactivecolor,
                          onChanged: (double value) {
                            setState(() {
                              currentheight = value.round();
                            });
                          }),
                    )
                  ],
                )),
          )),

          // ------------------weight--------------------
          Expanded(
            child: Row(
              children: [
                // --------------------weight----------------
                Expanded(
                    child: Reusablecard(
                        colour: inactivecolor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerTitile(title: 'WEIGHT'),
                            input(text: currentweight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentweight--;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentweight++;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.plus),
                                )
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: Reusablecard(
                        colour: inactivecolor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerTitile(title: 'AGE'),
                            input(text: currentage),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentage--;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentage++;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.plus),
                                )
                              ],
                            )
                          ],
                        ))),
              ],
            ),
          ),

          // ---------bottom button move to next-screen button---------
          GestureDetector(
            onTap: () {
              CalculatorBrain cal = CalculatorBrain(
                  currentheight: currentheight, currentweight: currentweight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Outputpage(
                          bmiresult: cal.calculateBMI(),
                          resulttext: cal.getResult(),
                          interpretetion: cal.getInterpretation(),
                          category:cal.Category(),
                      ))
              );
            },
            child: BottomButton('CALCULATE'),
          ),
        ],
      ),
    );
  }
}
