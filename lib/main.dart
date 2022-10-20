import 'package:deliveryapp/pages/home_page.dart';
import 'package:deliveryapp/pages/on_boarding.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Roboto'),
    home: OnBoarding(),
  )
);


