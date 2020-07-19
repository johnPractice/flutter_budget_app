import 'package:flutter/material.dart';

Color getColor({BuildContext context,double percent}){
  if (percent < .5) {
    return Theme.of(context).primaryColor;
  } else if (percent >= .5 && percent < .6) {
    return Colors.yellow;
  } else   {
    return Colors.red;
  }
}