class OfferResponse {
  int id;
  String offerId;
  String title;
  String subTitle;
  String description;
  String imageUrl;
  String actionSlug;
  int displayOrder;
  String startDate;
  String endDate;
  bool isActive;
  bool isPublic;
  String audience;
  String couponCode;
  int discountAmount;
  bool isPercentage;
  String appliesToAirlines;
  String purchaseType;
  double minimumPurchaseAmount;
  double minimumFlightPurchase;
  int limitTotalUse;
  int limitToPerUser;
  String terms;
  List<OfferFaQResponse> faQs;

  OfferResponse({
    required this.id,
    required this.offerId,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
    required this.actionSlug,
    required this.displayOrder,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.isPublic,
    required this.audience,
    required this.couponCode,
    required this.discountAmount,
    required this.isPercentage,
    required this.appliesToAirlines,
    required this.purchaseType,
    required this.minimumPurchaseAmount,
    required this.minimumFlightPurchase,
    required this.limitTotalUse,
    required this.limitToPerUser,
    required this.terms,
    required this.faQs,
  });

  // From JSON
  factory OfferResponse.fromJson(Map<String, dynamic> json) {
    return OfferResponse(
      id: json['id'],
      offerId: json['offerId'],
      title: json['title'],
      subTitle: json['subTitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      actionSlug: json['actionSlug'],
      displayOrder: json['displayOrder'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      isActive: json['isActive'],
      isPublic: json['isPublic'],
      audience: json['audience'],
      couponCode: json['couponCode'],
      discountAmount: json['discountAmount'],
      isPercentage: json['isPercentage'],
      appliesToAirlines: json['appliesToAirlines'],
      purchaseType: json['purchaseType'],
      minimumPurchaseAmount: json['minimumPurchaseAmount'].toDouble(),
      minimumFlightPurchase: json['minimumFlightPurchase'].toDouble(),
      limitTotalUse: json['limitTotalUse'],
      limitToPerUser: json['limitToPerUser'],
      terms: json['terms'],
      faQs: (json['faQs'] as List<dynamic>)
          .map((faq) => OfferFaQResponse.fromJson(faq))
          .toList(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'offerId': offerId,
      'title': title,
      'subTitle': subTitle,
      'description': description,
      'imageUrl': imageUrl,
      'actionSlug': actionSlug,
      'displayOrder': displayOrder,
      'startDate': startDate,
      'endDate': endDate,
      'isActive': isActive,
      'isPublic': isPublic,
      'audience': audience,
      'couponCode': couponCode,
      'discountAmount': discountAmount,
      'isPercentage': isPercentage,
      'appliesToAirlines': appliesToAirlines,
      'purchaseType': purchaseType,
      'minimumPurchaseAmount': minimumPurchaseAmount,
      'minimumFlightPurchase': minimumFlightPurchase,
      'limitTotalUse': limitTotalUse,
      'limitToPerUser': limitToPerUser,
      'terms': terms,
      'faQs': faQs.map((faq) => faq.toJson()).toList(),
    };
  }
}

class OfferFaQResponse {
  String question;
  String answer;
  int id;

  OfferFaQResponse({
    required this.question,
    required this.answer,
    required this.id,
  });

  // From JSON
  factory OfferFaQResponse.fromJson(Map<String, dynamic> json) {
    return OfferFaQResponse(
      question: json['question'],
      answer: json['answer'],
      id: json['id'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
      'id': id,
    };
  }
}
