import 'package:domain/model/skyClubModels/faq.dart';

class OfferDomain {
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
  List<Faq> faQs;


  OfferDomain({
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

}