class SignUpResponse {
  final String sub;
  final String email;
  final bool emailVerified;
  final String phoneNumber;
  final bool phoneNumberVerified;
  final String name;
  final String familyName;
  final String givenName;
  final String picture;
  final Map<String, dynamic> address;
  final List<String> roles;
  final DateTime updatedAt;
  final DateTime createdAt;

  SignUpResponse({
    required this.sub,
    required this.email,
    required this.emailVerified,
    required this.phoneNumber,
    required this.phoneNumberVerified,
    required this.name,
    required this.familyName,
    required this.givenName,
    required this.picture,
    required this.address,
    required this.roles,
    required this.updatedAt,
    required this.createdAt,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      sub: json['sub'],
      email: json['email'],
      emailVerified: json['email_verified'],
      phoneNumber: json['phone_number'],
      phoneNumberVerified: json['phone_number_verified'],
      name: json['name'],
      familyName: json['family_name'],
      givenName: json['given_name'],
      picture: json['picture'],
      address: json['address'] ?? {},
      roles: List<String>.from(json['roles']),
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}