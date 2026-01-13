
import 'package:data/remote/response/auth/user_response.dart';
class SkyUser {
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

  SkyUser({
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

  factory SkyUser.fromJson(Map<String, dynamic> json) {
    return SkyUser(
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
      roles: List<String>.from(json['roles'] ?? []),
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }

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

  UserResponse toUserResponse() {
    return UserResponse(
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

  static SkyUser exampleSkyUser = SkyUser(
    sub: '12345',
    email: 'example@example.com',
    emailVerified: true,
    phoneNumber: '+1234567890',
    phoneNumberVerified: true,
    name: 'John Doe',
    familyName: 'Doe',
    givenName: 'John',
    picture: 'https://example.com/photo.jpg',
    address: UserAddress(),
    roles: ['user'],
    updatedAt: '2025-01-30T12:00:00Z',
    createdAt: '2025-01-01T12:00:00Z',
  );
}
