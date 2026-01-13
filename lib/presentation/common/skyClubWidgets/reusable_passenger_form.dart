import 'dart:async';

import 'package:domain/enum/country.dart';
import 'package:domain/enum/frequent_flyer.dart';
import 'package:domain/enum/meal_request.dart';
import 'package:domain/enum/passenger_form_error.dart';
import 'package:domain/enum/passenger_type.dart';
import 'package:domain/enum/sex.dart';
import 'package:domain/enum/special_assistance.dart';
import 'package:domain/model/country.dart';
import 'package:domain/model/skyClubModels/passenger.dart';
import 'package:flutter/material.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/form_date_picker.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/form_drop_down.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/form_text_field.dart';
import 'package:sky_club/presentation/common/skyClubWidgets/searchable_form_drop_down.dart';
import 'package:sky_club/presentation/feature/bookform/widget/passenger_form.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';
import 'package:sky_club/presentation/values/dimens.dart';

class ReusablePassengerForm extends StatefulWidget {
  final String title;
  final PassengerType type;
  final int index;
  final Function(PassengerDomain) onFormChanged;
  final ValueNotifierList<PassengerFormError> errorList;

  ReusablePassengerForm({
    super.key,
    required this.title,
    required this.onFormChanged,
    required this.type,
    required this.index,
    required this.errorList,
  });

  @override
  State<ReusablePassengerForm> createState() => _ReusablePassengerFormState();
}

class _ReusablePassengerFormState extends State<ReusablePassengerForm> {
  PassengerDomain _getFormData() {
    return PassengerDomain(
      type: widget.type,
      typeIndex: widget.index,
      firstName: nameController.text.isNotEmpty ? nameController.text : null,
      lastName:
          lastNameController.text.isNotEmpty ? lastNameController.text : null,
      dateOfBirth: selectedDate.value,
      sex: selectedSex.value,
      passportNumber: passportNumberController.text.isNotEmpty
          ? passportNumberController.text
          : null,
      passportExpiryDate: null,
      issuingCountry: passportCountry.value,
      frequentFlyer: frequentFlyer.value,
      specialAssistance: specialAssistance.value,
      mealRequest: mealRequest.value,
      membershipNumber: membershipNumberController.text,
    );
  }

  void _addListeners() {
    nameController.addListener(() => widget.onFormChanged(_getFormData()));
    lastNameController.addListener(() => widget.onFormChanged(_getFormData()));
    selectedDate.addListener(() => widget.onFormChanged(_getFormData()));
    passportNumberController
        .addListener(() => widget.onFormChanged(_getFormData()));
    passportExpiryDateController
        .addListener(() => widget.onFormChanged(_getFormData()));
    passportCountry.addListener(() => widget.onFormChanged(_getFormData()));
    frequentFlyer.addListener(() => widget.onFormChanged(_getFormData()));
    specialAssistance.addListener(() => widget.onFormChanged(_getFormData()));
    membershipNumberController
        .addListener(() => widget.onFormChanged(_getFormData()));
    mealRequest.addListener(() => widget.onFormChanged(_getFormData()));
    selectedSex.addListener(() => widget.onFormChanged(_getFormData()));
  }

  final TextEditingController nameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);

  final TextEditingController membershipNumberController =
      TextEditingController();

  final mealRequest = ValueNotifier<MealRequest>(MealRequest.noPreference);

  final ValueNotifier<Countries?> passportCountry = ValueNotifier(null);

  final ValueNotifier<FrequentFlyer?> frequentFlyer = ValueNotifier(null);

  final ValueNotifier<SpecialAssistance> specialAssistance =
      ValueNotifier(SpecialAssistance.notRequired);

  final ValueNotifier<Sex> selectedSex = ValueNotifier(Sex.male);

  final TextEditingController passportNumberController =
      TextEditingController();

  final TextEditingController passportExpiryDateController =
      TextEditingController();

  ValueNotifier<bool> showPassportDetails = ValueNotifier<bool>(false);

  ValueNotifier<bool> showFrequentFlyer = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  @override
  void initState() {
    super.initState();

    widget.onFormChanged(_getFormData());
    _addListeners();
  }

  Widget _form(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: ValueListenableBuilder(
          valueListenable: widget.errorList,
          builder: (context, value, child) {
            return Column(
              children: [
                FormTextField(
                  controller: nameController,
                  label: 'Given name(s) (as on passport)',
                  hintText: 'Your given name(s) e.g Robert Anthony',
                  errorText: value.contains(PassengerFormError.firstName)
                      ? 'Please enter your name'
                      : null,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: Dimens.dimen_16),
                FormTextField(
                  controller: lastNameController,
                  label: 'Last Name / Surname (as on passport)',
                  hintText: 'Your given name(s) e.g Robert Anthony',
                  errorText: value.contains(PassengerFormError.lastName)
                      ? 'Please enter your last name'
                      : null,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: Dimens.dimen_16),
                ValueListenableBuilder(
                  valueListenable: selectedSex,
                  builder: (context, value, child) {
                    return FormDropDown<Sex>(
                      selectedItem: value,
                      label: 'Sex',
                      items: Sex.values,
                      itemToString: (sex) => sex.name,
                      onItemSelected: (selected) {
                        if (selected != null) {
                          selectedSex.value = selected;
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: Dimens.dimen_16),

                FormDatePicker(
                  label: 'Date of Birth',
                  firstDate: DateTime(1990),
                  lastDate: widget.type.lastSelectableDate,
                  onDateSelected: (date) {
                    selectedDate.value = date;
                  },
                  errorText: value.contains(PassengerFormError.dob)
                      ? 'Please enter Date of Birth'
                      : null,
                ),
                SizedBox(height: Dimens.dimen_16),
                ValueListenableBuilder(
                  valueListenable: specialAssistance,
                  builder: (context, value, child) {
                    return FormDropDown<SpecialAssistance>(
                      selectedItem: value,
                      label: 'Special Assistance',
                      items: SpecialAssistance.values,
                      itemToString: (assistance) => assistance.name,
                      onItemSelected: (selected) {
                        if (selected != null) {
                          specialAssistance.value = selected;
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: Dimens.dimen_16),
                ValueListenableBuilder(
                  valueListenable: mealRequest,
                  builder: (context, value, child) {
                    return FormDropDown<MealRequest>(
                      selectedItem: value,
                      label: 'Meal Request',
                      items: MealRequest.values,
                      itemToString: (meal) => meal.name,
                      onItemSelected: (selected) {
                        if (selected != null) {
                          mealRequest.value = selected;
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: Dimens.dimen_16),
              ],
            );
          }),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimen_16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.dimen_8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _formHeader(context),
          SizedBox(height: Dimens.dimen_16),
          Divider(
            height: 0,
            color: Colors.grey.shade400,
            thickness: 1,
          ),
          SizedBox(height: Dimens.dimen_16),
          _form(context),
          SizedBox(height: Dimens.dimen_16),
          ValueListenableBuilder(
              valueListenable: showPassportDetails,
              builder: (context, value, child) {
                if (value) {
                  return _passportDetailsForm(context);
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
                  child: _buildExtraButton(context, 'Add Passport Details', () {
                    showPassportDetails.value = true;
                  }),
                );
              }),
          SizedBox(height: Dimens.dimen_16),
          ValueListenableBuilder(
              valueListenable: showFrequentFlyer,
              builder: (context, value, child) {
                if (value) {
                  return _frequentFlyerForm(context);
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
                  child: _buildExtraButton(context, 'Add Frequent Flyer', () {
                    showFrequentFlyer.value = true;
                  }),
                );
              }),
          SizedBox(height: Dimens.dimen_16),
        ],
      ),
    );
  }

  Widget _formHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: Dimens.dimen_10,
          ),
          Text(
            'Enter only alphabetical characters (A to Z) without hyphens, apostrophes, or special characters.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Color(0xFF4F4F4F),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: Dimens.dimen_10,
          ),
        ],
      ),
    );
  }

  Widget _buildExtraButton(
      BuildContext context, String title, VoidCallback onPressed) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Color(0xFFF0EFF9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimen_8),
          ),
          minimumSize: Size(double.infinity, 40)),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _passportDetailsForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Passport Details',
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: Dimens.dimen_10),
          FormTextField(
            controller: passportNumberController,
            label: 'Passport Number',
            hintText: 'Enter Passport Number',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: Dimens.dimen_16),
          ValueListenableBuilder(
            valueListenable: passportCountry,
            builder: (context, value, child) {
              return FormDropDown<Countries>(
                label: 'Issuing Country',
                items: Countries.values,
                itemToString: (country) => country.name,
                onItemSelected: (selected) {
                  if (selected != null) {
                    passportCountry.value = selected;
                  }
                },
              );
            },
          ),
          SizedBox(height: Dimens.dimen_16),
          FormTextField(
            controller: passportExpiryDateController,
            label: 'Expire Date',
            hintText: 'MM/DD/YYYY',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: Dimens.dimen_16),
        ],
      ),
    );
  }

  Widget _frequentFlyerForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimen_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Frequent Flyer', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: Dimens.dimen_10),
          ValueListenableBuilder(
            valueListenable: frequentFlyer,
            builder: (context, value, child) {
              return FormDropDown<FrequentFlyer>(
                label: 'Frequent Flyer Program',
                items: FrequentFlyer.values,
                itemToString: (flyer) => flyer.name,
                onItemSelected: (selected) {
                  if (selected != null) {
                    frequentFlyer.value = selected;
                  }
                },
              );
            },
          ),
          SizedBox(height: Dimens.dimen_16),
          FormTextField(
            controller: membershipNumberController,
            label: 'Membership Number',
            hintText: 'Enter Membership Number',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: Dimens.dimen_16),
        ],
      ),
    );
  }

  String? getTextValidationError(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field is required';
    }
    return null;
  }
}
