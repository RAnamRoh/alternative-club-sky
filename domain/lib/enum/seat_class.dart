import 'package:flutter/material.dart';


enum SeatClass {
  premiumFirst,
  first,
  premiumBusiness,
  business,
  premiumEconomy,
  economy
}

extension SeatClassExtension on SeatClass {
  String get seatName {
    switch (this) {
      case SeatClass.premiumFirst:
        return 'Premium First';
      case SeatClass.first:
        return 'First';
      case SeatClass.premiumBusiness:
        return 'Premium Business';
      case SeatClass.business:
        return 'Business';
      case SeatClass.premiumEconomy:
        return 'Premium Economy';
      case SeatClass.economy:
        return 'Economy';
    }
  }

  static SeatClass getSeatClassFromString(String seatClassString) {
    final formattedString = seatClassString.replaceAll(' ', '').toLowerCase();
    switch (formattedString) {
      case 'premiumfirst':
        return SeatClass.premiumFirst;
      case 'first':
        return SeatClass.first;
      case 'premiumbusiness':
        return SeatClass.premiumBusiness;
      case 'business':
        return SeatClass.business;
      case 'premiumeconomy':
        return SeatClass.premiumEconomy;
      case 'economy':
        return SeatClass.economy;
      default:
        return SeatClass.economy;
    }
  }



}