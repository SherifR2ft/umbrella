import 'package:flutter/material.dart';

const apiKey = '5ecd82182a24eb999e5ff02f76fee70d';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 65.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 35.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',

);

const kConditionTextStyle = TextStyle(
  fontSize: 60.0,

);

const decorationTextField = InputDecoration(

  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),

  filled: true ,
  //fillColor: Colors.white,
  hintText: 'Please enter city name ',
  hintStyle: TextStyle(
    color: Colors.white70,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
