




import 'package:domain/model/skyClubModels/subscription_state.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:domain/model/skyClubModels/user_subscription_domain.dart';

import '../enum/subscription_bill.dart';
import '../enum/subscription_level.dart';

abstract class RewardRepository {

  // Future<SubscriptionState> fetchSubscriptionState();
  // Future<void> updateSubscription({required SubscriptionState subscriptionState});
  Future<String> makePayment({required String membershipType, required String interval });
  Future<UserSubscriptionDomain?> getSubscriptionStatus();
  Future<List<SubscriptionTypeDomain>> getSubscriptionType();
  Future<void> cancelSubscription({required String subscriptionId});


}