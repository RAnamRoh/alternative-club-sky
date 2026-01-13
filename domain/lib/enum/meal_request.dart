import 'package:flutter/material.dart';

enum MealRequest {
  noPreference,
  babyMeal,
  childMeal,
  glutenFree,
  veg,
  vegNonDairy,
  muslimMeal,
  hinduMeal,
}

extension MealRequestExtension on MealRequest {
  String get name {
    switch (this) {
      case MealRequest.noPreference:
        return 'No Preference';
      case MealRequest.babyMeal:
        return 'Baby Meal';
      case MealRequest.childMeal:
        return 'Child Meal';
      case MealRequest.glutenFree:
        return 'Gluten Free Meal';
      case MealRequest.veg:
        return 'Vegetarian Meal (Lacto-Ovo)';
      case MealRequest.vegNonDairy:
        return 'Vegetarian Meal (Non-Dairy)';
      case MealRequest.muslimMeal:
        return 'Muslim Meal';
      case MealRequest.hinduMeal:
        return 'Hindu Meal';
    }
  }
}