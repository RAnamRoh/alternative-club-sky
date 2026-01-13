
import 'package:data/local/shared_preference/entity/shared_pref_entity.dart';
import 'package:data/model/mappable.dart';
import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/enum/subscription_level.dart';

class SubscriptionSharedPrefEntity extends SharedPrefEntity {

  final bool isSubscribed;
  final SubscriptionLevel? subscriptionLevel;
  final DateTime? expiryDate;
  final DateTime? subscriptionDate;
  final SubscriptionBill? subscriptionBill;

  SubscriptionSharedPrefEntity({
    required this.isSubscribed,
    this.subscriptionLevel,
    this.expiryDate,
    this.subscriptionDate,
    this.subscriptionBill
  });


  @override
  String sharedPrefKey = 'user_subscription';

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    return SubscriptionSharedPrefEntity(
      isSubscribed: json['isSubscribed'] as bool,
      subscriptionLevel: json['subscriptionLevel'] != null
          ? SubscriptionLevel.values
          .firstWhere((e) => e.name == json['subscriptionLevel'])
          : null,
      expiryDate: json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null,
      subscriptionDate: json['subscriptionDate'] != null ? DateTime.parse(json['subscriptionDate']) : null,
      subscriptionBill: json['subscriptionBill'] != null
          ? SubscriptionBill.values
          .firstWhere((e) => e.name == json['subscriptionBill'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'isSubscribed': isSubscribed,
      'subscriptionLevel': subscriptionLevel?.name,
      'expiryDate': expiryDate?.toIso8601String(),
      'subscriptionDate': subscriptionDate?.toIso8601String(),
      'subscriptionBill': subscriptionBill?.name
    };
  }

  static SubscriptionSharedPrefEntity get defaultEntity =>
      SubscriptionSharedPrefEntity(isSubscribed: false, subscriptionLevel: null, expiryDate: null, subscriptionDate: null, subscriptionBill: null);

}