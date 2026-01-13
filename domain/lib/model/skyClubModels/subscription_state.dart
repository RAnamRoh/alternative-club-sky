
import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';

import '../../enum/subscription_level.dart';

class SubscriptionState {
  final bool isSubscribed;
  final SubscriptionBill? subscriptionBill;
  final DateTime? subscriptionDate;
  final DateTime? expiryDate;
  final SubscriptionTypeDomain? subscriptionLevel;
  final int? point;

  SubscriptionState({required this.isSubscribed, this.subscriptionDate, this.expiryDate, this.subscriptionLevel, this.subscriptionBill,this.point});

  static SubscriptionState defaultEntity = SubscriptionState(isSubscribed: false);

}