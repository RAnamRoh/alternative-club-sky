import 'package:data/remote/response/auth/user_response.dart';

class UserUpdateRequest {
  String sub;
  String email;
  String phoneNumber;
  String? familyName;
  String? givenName;
  UserAddress address;

  UserUpdateRequest({
    required this.sub,
    required this.email,
    required this.phoneNumber,
    this.familyName,
    this.givenName,
    required this.address,
  });

  // From JSON
  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) {
    return UserUpdateRequest(
      sub: json['sub'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      familyName: json['family_name'],
      givenName: json['given_name'],
      address: UserAddress.fromJson(json['address'] ?? {}),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'sub': sub,
      'email': email,
      'phone_number': phoneNumber,
      'family_name': familyName,
      'given_name': givenName,
      'address': address.toJson(),
    };
  }
}
