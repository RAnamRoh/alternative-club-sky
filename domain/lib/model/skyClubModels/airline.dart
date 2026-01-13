import 'dart:ui';
import 'package:flutter/material.dart';

class AirlineDomain {
  final String name;
  final String code;
  final String logo_url;
  final String flightNumber;


  AirlineDomain({required this.name, required this.code, required this.logo_url, required this.flightNumber});

static List<AirlineDomain> dummyData = [
    AirlineDomain(name: 'Turkish Airlines', code: 'TK', logo_url: 'assets/images/turkish_airways_logo.png', flightNumber: 'TK123'),
    AirlineDomain(name: 'Qatar Airways', code: 'QA', logo_url: 'assets/images/qatar_airways_logo.png', flightNumber: 'QA456'),
    AirlineDomain(name: 'Singapore Airlines', code: 'SA', logo_url: 'assets/images/singapore_airlines_logo.png', flightNumber: 'SA789'),
    AirlineDomain(name: 'Saudi Arabian Airlines', code: 'UA', logo_url: 'assets/images/saudia_arabia_airlines_logo.png', flightNumber: 'SA456'),

  ];



}