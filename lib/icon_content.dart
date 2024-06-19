import 'package:flutter/material.dart';

Widget IconContent({icon, label}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: 80,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.grey,fontWeight: FontWeight.bold),
      )
    ],
  );
}