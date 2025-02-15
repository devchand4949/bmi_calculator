import 'dart:math';
import 'fun-widget.dart';
import 'package:flutter/material.dart';

 class CalculatorBrain {
   CalculatorBrain({required this.currentheight, required this.currentweight});

   final int currentheight;
   final int currentweight;

   double? _bmi; // Make _bmi nullable

   String calculateBMI() {
     _bmi = currentweight / pow(currentheight / 100, 2);
     return _bmi!.toStringAsFixed(1);
   }

   String getResult() {
     if (_bmi! >= 25) {
       return 'Overweight';
     } else if (_bmi! > 18.5) {
       return 'Normal';
     } else {
       return 'Underweight';
     }
   }

   String getInterpretation() {
     if (_bmi! >= 25) {
       return 'You have a higher than normal body weight. Try to exercise more.';
     } else if (_bmi! > 18.5) {
       return 'You have a normal body weight. Good job!';
     } else {
       return 'You have a lower than normal body weight. You can eat a bit more.';
     }
   }

   String Category() {
     return 'Overweight : >=25 \n Normal : 18.5 - 25 \n Underweight : 16 -18.5';
   }

 }
