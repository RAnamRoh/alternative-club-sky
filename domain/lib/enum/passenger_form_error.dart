import 'package:flutter/material.dart';

enum PassengerFormError {
  firstName,
  lastName,
  dob,
  mobile,
  email,
}

extension PassengerFormErrorExtension on PassengerFormError {
  String get name {
    switch (this) {
      case PassengerFormError.firstName:
        return 'First Name';
      case PassengerFormError.lastName:
        return 'Last Name';
      case PassengerFormError.dob:
        return 'Date of Birth';
      case PassengerFormError.mobile:
        return 'Mobile';
      case PassengerFormError.email:
        return 'Email';
    }
  }
}
