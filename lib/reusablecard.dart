import 'package:flutter/material.dart';

Widget Reusablecard({colour ,Widget? cardChild}) {

  return Container(
    child: cardChild,
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10)),
  );
}
