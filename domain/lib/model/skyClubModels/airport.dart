import 'package:flutter/material.dart';

class Airport {
  final String name;
  final String city;
  final String country;
  final String code;

  const Airport({
    required this.name,
    required this.city,
    required this.country,
    required this.code,
  });


  static Airport dummyAirport1 = const Airport(
    name: "Sydney Airport",
    city: "Sydney",
    country: "Australia",
    code: "SYD",
  );

  static Airport dummyAirport2 = const Airport(
    name: "Melbourne Airport",
    city: "Melbourne",
    country: "Australia",
    code: "MEL",
  );





}