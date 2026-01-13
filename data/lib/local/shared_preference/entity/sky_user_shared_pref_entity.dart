import 'package:data/local/shared_preference/entity/shared_pref_entity.dart';
import 'package:data/model/mappable.dart';
import 'package:data/remote/response/auth/user_response.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';


class SkyUserSharedPrefEntity extends SharedPrefEntity {
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

  SkyUserSharedPrefEntity({
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

  factory SkyUserSharedPrefEntity.fromJson(Map<String, dynamic> json) {
    return SkyUserSharedPrefEntity(
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

  @override
  String sharedPrefKey = 'sky_user';

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return SkyUserSharedPrefEntity.fromJson(json);
  }

  @override
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

  /// Static default entity
  static SkyUserSharedPrefEntity example = SkyUserSharedPrefEntity(
    sub: '',
    email: '',
    emailVerified: false,
    phoneNumber: '',
    phoneNumberVerified: false,
    name: '',
    familyName: '',
    givenName: '',
    picture: '',
    address: UserAddress(),
    roles: [],
    updatedAt: '',
    createdAt: '',
  );

  SkyUser toSkyUser() {
    return SkyUser(
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



  bool isValid() {
    return sub.isNotEmpty && email.isNotEmpty;
  }
}