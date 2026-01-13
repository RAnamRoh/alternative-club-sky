

class SubscriptionTypeDomain {
  int id;
  String membershipType;
  double price;
  double pointUnit;
  int percentageDiscount;
  String currency;
  String interval;
  String color;
  String stripePriceId;
  List<BenefitDomain> benefits;

  SubscriptionTypeDomain({
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

  factory SubscriptionTypeDomain.fromJson(Map<String, dynamic> json) {
    return SubscriptionTypeDomain(
      id: json['id'],
      membershipType: json['membershipType'],
      price: json['price'].toDouble(),
      pointUnit: json['pointUnit'],
      percentageDiscount: json['percentageDiscount'],
      currency: json['currency'],
      interval: json['interval'],
      color: json['color'],
      stripePriceId: json['stripePriceId'],
      benefits: List<BenefitDomain>.from(
        json['benefits'].map((benefit) => BenefitDomain.fromJson(benefit)),
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

  static SubscriptionTypeDomain exampleSubscription = SubscriptionTypeDomain(
    id: 7,
    membershipType: "Standard",
    price: 25.0,
    pointUnit: 5,
    percentageDiscount: 0,
    currency: "aud",
    interval: "month",
    color: "#00a1ca",
    stripePriceId: "price_1QIrA3JvBtA4C4rCTPBBKDI0",
    benefits: [
      BenefitDomain(
        id: 1,
        title: "Access to Basic Content",
        description: "Enjoy unlimited access to our standard content library, including articles, videos, and basic tutorials to help you get started.",
        isAvailable: true,
      ),
    ],
  );

  static List<SubscriptionTypeDomain> exampleSubscriptionList = [
    exampleSubscription,
  SubscriptionTypeDomain(
    id: 8,
    membershipType: "Gold",
    price: 65.0,
    pointUnit: 10,
    percentageDiscount: 0,
    currency: "aud",
    interval: "month",
    color: "#ffa800",
    stripePriceId: "price_1QIrBVJvBtA4C4rCqUFMLUyF",
    benefits: [
      BenefitDomain(
        id: 1,
        title: "Access to Basic Content",
        description: "Enjoy unlimited access to our standard content library, including articles, videos, and basic tutorials to help you get started.",
        isAvailable: false,
      ),
    ],
  ),
  SubscriptionTypeDomain(
    id: 12,
    membershipType: "Platinum",
    price: 95.0,
    pointUnit: 20,
    percentageDiscount: 0,
    currency: "aud",
    interval: "monthly",
    color: "#c2c2c2",
    stripePriceId: "price_1QIrBVJvBtA4C4rCqUFMLUyF",
    benefits: [
      BenefitDomain(
        id: 1,
        title: "Access to Basic Content",
        description: "Enjoy unlimited access to our standard content library, including articles, videos, and basic tutorials to help you get started.",
        isAvailable: true,
      ),
    ],
  ),

  ];

}

class BenefitDomain {
  int id;
  String title;
  String description;
  bool isAvailable;

  BenefitDomain({
    required this.id,
    required this.title,
    required this.description,
    required this.isAvailable,
  });

  factory BenefitDomain.fromJson(Map<String, dynamic> json) {
    return BenefitDomain(
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
}