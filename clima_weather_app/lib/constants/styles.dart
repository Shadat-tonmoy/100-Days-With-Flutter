import 'package:flutter/material.dart';

final inputFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(
      Icons.location_on,
      color: Colors.grey[600],
    ),
    hintText: "Enter City Name",
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide.none
    )
);