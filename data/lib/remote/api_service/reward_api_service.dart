import 'package:data/remote/response/subscription/subscription_type_response.dart';
import 'package:data/remote/response/subscription/user_subscription_response.dart';

abstract class RewardApiService {

  Future<String> checkOutSubscription({required String userId, required String membershipType, required String interval});
  Future<UserSubscriptionResponse?> getSubscriptionStatus();
  Future<List<SubscriptionTypeResponse>> getSubscriptionType();
  Future<void> cancelSubscription({required String subscriptionId});


}