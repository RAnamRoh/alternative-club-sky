class SignUpRequest {
  final String givenName;
  final String familyName;
  final String email;
  final String phoneNumber;
  final String password;

  SignUpRequest({
    required this.givenName,
    required this.familyName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  List<String> get roles => ["MEMBER"]; // Always returns 'MEMBER' role

  Map<String, dynamic> toJson() {
    return {
      'given_name': givenName,
      'family_name': familyName,
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'roles': roles,
    };
  }
}