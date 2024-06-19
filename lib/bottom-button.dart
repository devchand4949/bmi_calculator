import 'fun-widget.dart';
import 'package:flutter/material.dart';

Widget BottomButton(txt){
  return Container(
    child: Center(
        child: CalculateStyle(txt)),
    decoration: BoxDecoration(
      color: Colors.pink,
    ),
    margin: const EdgeInsets.only(top: 10),
    height: 80,
    width: double.infinity,
  );
}