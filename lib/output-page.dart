import 'package:bmi_calculator/reusablecard.dart';
import 'fun-widget.dart';
import 'input_page.dart';
import 'bottom-button.dart';
import 'calculateBmi.dart';
import 'package:flutter/material.dart';

class Outputpage extends StatelessWidget {
  Outputpage({required this.bmiresult,required this.resulttext,
    required this.interpretetion,required this.category});

   final String bmiresult;
   final String resulttext;
   final String interpretetion;
   final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                child: Text(
                            'Your Result',
                            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 50,
                              color: activecolor
                            ),
                          ),
              )),
          Expanded(
              flex: 5,
              child: Reusablecard(
                  colour: inactivecolor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChangebleStyle(
                          txt: resulttext.toUpperCase(),
                          fsize: 30.0,
                          fweight: FontWeight.w700,
                          txtxcolor: Colors.green
                      ),
                      ChangebleStyle(
                          txt: bmiresult.toUpperCase(),
                          fsize: 80.0,
                          fweight: FontWeight.w900,
                          txtxcolor: Colors.green
                      ),
                      ChangebleStyle(
                          txt: category,
                          fsize: 20.0,
                          fweight: FontWeight.w500,
                          txtxcolor: Colors.white,
                      ),
                      ChangebleStyle(
                          txt: interpretetion.toUpperCase(),
                          fsize: 23.0,
                          fweight: FontWeight.w700,
                          txtxcolor: Colors.green
                      ),

                    ],

                  ))),
          GestureDetector(
            onTap: (){
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child:BottomButton('RE-CALCULATE'),
          ),
        ],
      ),
    );
  }
}
