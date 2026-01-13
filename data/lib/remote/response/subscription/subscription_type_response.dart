import 'package:domain/model/skyClubModels/subscription_type_domain.dart';

class SubscriptionTypeResponse {
  int id;
  String membershipType;
  double price;
  double pointUnit;
  int percentageDiscount;
  String currency;
  String interval;
  String color;
  String stripePriceId;
  List<Benefit> benefits;

  SubscriptionTypeResponse({
    required this.id,
    required this.membershipType,
    required this.price,
    required this.pointUnit,
    required this.percentageDiscount,
    required this.currency,
    required this.interval,
    required this.color,
    required this.stripePriceId,
    required this.benefits,
  });

  factory SubscriptionTypeResponse.fromJson(Map<String, dynamic> json) {
    return SubscriptionTypeResponse(
      id: json['id'],
      membershipType: json['membershipType'],
      price: json['price'].toDouble(),
      pointUnit: json['pointUnit'].toDouble(),
      percentageDiscount: json['percentageDiscount'],
      currency: json['currency'],
      interval: json['interval'],
      color: json['color'],
      stripePriceId: json['stripePriceId'] ?? '',
      benefits: List<Benefit>.from(
        json['benefits'].map((benefit) => Benefit.fromJson(benefit)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'membershipType': membershipType,
      'price': price,
      'pointUnit': pointUnit,
      'percentageDiscount': percentageDiscount,
      'currency': currency,
      'interval': interval,
      'color': color,
      'stripePriceId': stripePriceId,
      'benefits': benefits.map((benefit) => benefit.toJson()).toList(),
    };
  }


  SubscriptionTypeDomain toDomain() {
    return SubscriptionTypeDomain(
      id: id,
      membershipType: membershipType,
      price: price,
      pointUnit: pointUnit,
      percentageDiscount: percentageDiscount,
      currency: currency,
      interval: interval,
      color: color,
      stripePriceId: stripePriceId,
      benefits: benefits.map((benefit) => benefit.toDomain()).toList(),
    );
  }


}

class Benefit {
  int id;
  String title;
  String description;
  bool isAvailable;

  Benefit({
    required this.id,
    required this.title,
    required this.description,
    required this.isAvailable,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isAvailable': isAvailable,
    };
  }


  BenefitDomain toDomain() {
    return BenefitDomain(
      id: id,
      title: title,
      description: description,
      isAvailable: isAvailable,
    );
  }


}