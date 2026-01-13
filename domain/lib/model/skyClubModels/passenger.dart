import 'package:domain/enum/country.dart';
import 'package:domain/enum/frequent_flyer.dart';
import 'package:domain/enum/meal_request.dart';
import 'package:domain/enum/passenger_type.dart';
import 'package:domain/enum/sex.dart';
import 'package:domain/enum/special_assistance.dart';


class PassengerDomain {
  final PassengerType type;
  final int typeIndex;
  final String? firstName;
  final String? lastName;
  final Sex? sex;
  final DateTime? dateOfBirth;
  final SpecialAssistance? specialAssistance;
  final MealRequest? mealRequest;
  final String? passportNumber;
  final Countries? issuingCountry;
  final DateTime? passportExpiryDate;
  final FrequentFlyer? frequentFlyer;
  final String? membershipNumber;
  final String? nameError;

  PassengerDomain({
    required this.type,
    required this.typeIndex,
    this.firstName,
    this.lastName,
    this.sex,
    this.dateOfBirth,
    this.specialAssistance,
    this.mealRequest,
    this.passportNumber,
    this.issuingCountry,
    this.passportExpiryDate,
    this.frequentFlyer,
    this.membershipNumber,
    this.nameError
  });

}
