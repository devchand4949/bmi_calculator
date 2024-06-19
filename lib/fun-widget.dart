import 'package:flutter/material.dart';


Color activecolor = Color(0xfff06292);
Color inactivecolor = Color(0XFF1D1E33);

Widget ContainerTitile ({title}){
  return Text(
    title,
    style:
    TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
  );
}
Widget input({text}){
  return  Text(
    text.toString(),
    style: TextStyle(
        fontSize: 35, fontWeight: FontWeight.w900),
  );
}
Widget CalculateStyle( String txt){
  return Text(
    txt,
    style: TextStyle(
        fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: 2),
  );
}


Widget ChangebleStyle ({txt,fsize,fweight,txtxcolor}){
  return Text(
    txt,
    style:
    TextStyle(fontSize: fsize, fontWeight:fweight,color: txtxcolor),
  );
}