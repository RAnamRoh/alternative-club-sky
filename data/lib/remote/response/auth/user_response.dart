import 'package:data/local/shared_preference/entity/sky_user_shared_pref_entity.dart';
import 'package:data/remote/request/user_update_request.dart';

class UserResponse {
  String sub;
  String email;
  bool emailVerified;
  String phoneNumber;
  bool phoneNumberVerified;
  String? name;
  String? familyName;
  String? givenName;
  String? picture;
  UserAddress address;
  List<String> roles;
  String updatedAt;
  String createdAt;

  UserResponse({
    required this.sub,
    required this.email,
    required this.emailVerified,
    required this.phoneNumber,
    required this.phoneNumberVerified,
    this.name,
    this.familyName,
    this.givenName,
    this.picture,
    required this.address,
    required this.roles,
    required this.updatedAt,
    required this.createdAt,
  });

  // From JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      sub: json['sub'],
      email: json['email'],
      emailVerified: json['email_verified'],
      phoneNumber: json['phone_number'],
      phoneNumberVerified: json['phone_number_verified'],
      name: json['name'],
      familyName: json['family_name'],
      givenName: json['given_name'],
      picture: json['picture'],
      address: UserAddress.fromJson(json['address'] ?? {}),
      roles: List<String>.from(json['roles']),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'sub': sub,
      'email': email,
      'email_verified': emailVerified,
      'phone_number': phoneNumber,
      'phone_number_verified': phoneNumberVerified,
      'name': name,
      'family_name': familyName,
      'given_name': givenName,
      'picture': picture,
      'address': address.toJson(),
      'roles': roles,
      'updated_at': updatedAt,
      'created_at': createdAt,
    };
  }
}

class UserAddress {
  String? street;
  String? suiteNo;
  String? postalCode;
  String? city;
  String? country;
  String? state;

  UserAddress({
    this.street,
    this.suiteNo,
    this.postalCode,
    this.city,
    this.country,
    this.state,
  });

  // From JSON
  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      street: json['street'],
      suiteNo: json['suiteNo'],
      postalCode: json['postal_code'],
      city: json['city'],
      country: json['country'],
      state: json['state'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suiteNo': suiteNo,
      'postal_code': postalCode,
      'city': city,
      'country': country,
      'state': state,
    };
  }
}

extension UserResponseExtension on UserResponse {
  SkyUserSharedPrefEntity toSkyUserSharedPrefEntity() {
    return SkyUserSharedPrefEntity(
      sub: sub,
      email: email,
      emailVerified: emailVerified,
      phoneNumber: phoneNumber,
      phoneNumberVerified: phoneNumberVerified,
      name: name,
      familyName: familyName,
      givenName: givenName,
      picture: picture,
      address: address,
      roles: roles,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }


  UserUpdateRequest toUserUpdateRequest() {
    return UserUpdateRequest(
      sub: sub,
      email: email,
      phoneNumber: phoneNumber,
      familyName: familyName,
      givenName: givenName,
      address: address,
    );
  }

}
