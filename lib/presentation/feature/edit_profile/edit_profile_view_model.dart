import 'dart:io';

import 'package:data/remote/response/auth/user_response.dart';
import 'package:domain/enum/country.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:domain/repository/sky_auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:club_alt/presentation/base/base_viewmodel.dart';
import 'package:club_alt/presentation/common/extension/context_ext.dart';
import 'package:club_alt/presentation/feature/auth/validator/email_validator.dart';
import 'package:club_alt/presentation/feature/edit_profile/route/edit_profile_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_argument.dart';
import 'package:club_alt/presentation/feature/skybase/route/skybase_route.dart';
import 'package:club_alt/presentation/localization/ui_text.dart';

class EditProfileViewModel extends BaseViewModel<EditProfileArgument> {

 final TextEditingController firstNameController = TextEditingController();
 final TextEditingController lastNameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController phoneController = TextEditingController();

 final TextEditingController streetController = TextEditingController();
 final TextEditingController houseNumberController = TextEditingController();
 final TextEditingController stateController = TextEditingController();
 final TextEditingController countryController = TextEditingController();
 final TextEditingController cityController = TextEditingController();

 final ValueNotifier<PhoneNumber?> phoneNumberNotifier = ValueNotifier(null);

 final ValueNotifier<SkyUser?> skyUser = ValueNotifier(null);

 final ValueNotifier<File?> image = ValueNotifier(null);

 final ValueNotifier<Countries?> passportCountry = ValueNotifier(null);

 ValueNotifier<String> initialCountryCode = ValueNotifier('BD');
 ValueNotifier<String> initialDialCode = ValueNotifier('+880');
 ValueNotifier<String> initialPhoneNumber = ValueNotifier('');


final SkyAuthRepository authRepository;


  EditProfileViewModel({required this.authRepository});

  @override
  void onViewReady({EditProfileArgument? argument}) {
    super.onViewReady();
    setInitialValues(argument!.user);
    parsePhoneNumber(argument.user.phoneNumber);
    image.addListener(() {
      print("Image: ${image.value!.path}");
    });
  }

  @override
  void onDispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    streetController.dispose();
    houseNumberController.dispose();
    stateController.dispose();
    countryController.dispose();
    cityController.dispose();
    super.onDispose();
  }

 String? getEmailError(BuildContext context) {
   if (emailController.selection.baseOffset == -1) return null;
   EmailValidationError? emailError =
   EmailValidator.getValidationError(emailController.text);
   if (emailError == null) return null;

   if (emailError == EmailValidationError.empty) {
     return context.localizations.login__login_form__email_field_empty;
   }
   if (emailError == EmailValidationError.invalid) {
     return context
         .localizations.login__login_form__email_field_invalid_email_text;
   }
   return null;
 }


 void setInitialValues(SkyUser user) {
   firstNameController.text = user.givenName ?? '';
   lastNameController.text = user.familyName ?? '';
   emailController.text = user.email ?? '';
   streetController.text = user.address.street ?? '';
   houseNumberController.text = user.address.suiteNo ?? '';
   stateController.text = user.address.state ?? '';
   countryController.text = user.address.country ?? '';
   passportCountry.value = CountryExtension.fromString(user.address.country ?? '');
   cityController.text = user.address.city ?? '';
   skyUser.value = user;

 }

 void parsePhoneNumber(String input) {
   // Regular expression to match the pattern
   RegExp regex = RegExp(r"(\w+)\|(\+\d+)-(\d+)");

   // Match the input string against the regex
   Match? match = regex.firstMatch(input);

   if (match != null) {
     String countryCode = match.group(1) ?? ""; // Extract country code
     String dialCode = match.group(2) ?? "";      // Extract dial code
     String phoneNumber = match.group(3) ?? "";   // Extract phone number

     initialCountryCode.value = countryCode;
     initialDialCode.value = dialCode;
     initialPhoneNumber.value = phoneNumber;
     phoneController.text = initialPhoneNumber.value;

     debugPrint("countryCode: ${initialCountryCode.value}");
     debugPrint("dial code: ${initialDialCode.value}");
     debugPrint("phone number: ${initialPhoneNumber.value}");

     PhoneNumber initialNumber = PhoneNumber(countryISOCode: initialCountryCode.value, countryCode: initialDialCode.value, number: initialPhoneNumber.value);
     phoneNumberNotifier.value = initialNumber;


   } else {
     // Handle invalid input (e.g., throw an exception or return an error map)
     debugPrint("Invalid phone number format: $input"); // Optional debug print

     // Or, if you want to throw an exception:
     // throw FormatException("Invalid phone number format: $input");
   }



 }

 Future<void> onClickSave() async {

   final phoneNumber = phoneNumberNotifier.value;
   if (phoneNumber == null || phoneNumber.number.isEmpty) {
     debugPrint('Mobile number is invalid');
     return;
   }

   // Extract the country code (e.g., "BD") and the complete number (e.g., "+8801677397270")
   final countryCode = phoneNumber.countryISOCode; // e.g., "BD"
   final completeNumber = phoneNumber.completeNumber; // e.g., "+8801677397270"

   // Split the complete number into country code and local number
   final countryDialCode = phoneNumber.countryCode; // e.g., "+880"
   final localNumber = phoneNumber.number; // e.g., "1677397270"

   // Format the mobile number as "BD|+880-1677397270"
   final formattedMobileNumber = '$countryCode|$countryDialCode-$localNumber';

   final user =
   SkyUser(
     sub: skyUser.value!.sub,
     email: emailController.text,
     emailVerified: skyUser.value!.emailVerified,
     phoneNumber: formattedMobileNumber,
     phoneNumberVerified: skyUser.value!.phoneNumberVerified,
     name: '${firstNameController.text} ${lastNameController.text}',
     familyName: lastNameController.text,
     givenName: firstNameController.text,
     picture: skyUser.value!.picture,
     address: UserAddress(
       street: streetController.text,
       suiteNo: houseNumberController.text,
       postalCode: '',
       city: cityController.text,
       country: countryController.text,
       state: stateController.text,
     ),
     roles: skyUser.value!.roles,
     updatedAt: skyUser.value!.updatedAt,
     createdAt: skyUser.value!.createdAt,
   );

   if (image.value != null) {
     await loadData(() => authRepository.uploadMedia(imageFile: image.value!));
   }


   await loadData(() => authRepository.updateUser(user: user));

   showToast(uiText: FixedUiText(text: 'Update Successful'));

   navigateToScreen(destination: SkybaseRoute(arguments: SkybaseArgument()), isClearBackStack: true);

 }

 void selectPicture() async{
  await pickImage().then((value) => image.value = value);
 }

 Future<File?> pickImage() async {
   final ImagePicker _picker = ImagePicker();
   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
   if (image != null) {
     return File(image.path);
   }
   return null;
 }

 void removeImage() {
   image.value = null;
 }




}
