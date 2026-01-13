class CurrentLocationResponse {
  final String ip;
  final String city;
  final String region;
  final String country;
  final String loc;
  final String org;
  final String postal;
  final String timezone;
  final String readme;

  CurrentLocationResponse({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.postal,
    required this.timezone,
    required this.readme,
  });

  factory CurrentLocationResponse.fromJson(Map<String, dynamic> json) {
    return CurrentLocationResponse(
      ip: json['ip'] ?? '',
      city: json['city'] ?? '',
      region: json['region'] ?? '',
      country: json['country'] ?? '',
      loc: json['loc'] ?? '',
      org: json['org'] ?? '',
      postal: json['postal'] ?? '',
      timezone: json['timezone'] ?? '',
      readme: json['readme'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'city': city,
      'region': region,
      'country': country,
      'loc': loc,
      'org': org,
      'postal': postal,
      'timezone': timezone,
      'readme': readme,
    };
  }
}
