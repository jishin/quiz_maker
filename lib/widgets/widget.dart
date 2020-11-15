import 'dart:ui';

import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return RichText(
    //textAlign: TextAlign.left,
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(text: 'Quiz', style: TextStyle(fontWeight: FontWeight.w400
        ,color: Colors.black54)),
        TextSpan(text: 'Maker', style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.blue)),

      ],
    ),
  );
}

Widget blueButton({BuildContext context, String input, buttonWidth}){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30)
    ),
    alignment: Alignment.center,
    width: buttonWidth!=null? buttonWidth : MediaQuery.of(context).size.width - 48,
    child: Text(input,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}