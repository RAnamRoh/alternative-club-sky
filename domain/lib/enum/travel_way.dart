import 'package:flutter/material.dart';


enum TravelWay {
  oneWay,
  roundTrip,
  multiCity
}


extension TravelWayExtension on TravelWay {
  String get name {
    switch (this) {
      case TravelWay.oneWay:
        return 'One Way';
      case TravelWay.roundTrip:
        return 'Return';
      case TravelWay.multiCity:
        return 'Multi City';
    }
  }
}