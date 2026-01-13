

import 'package:data/remote/api_client/api_client.dart';
import 'package:data/remote/api_service/reward_api_service.dart';
import 'package:data/remote/response/subscription/subscription_type_response.dart';
import 'package:data/remote/response/subscription/user_subscription_response.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/exceptions/authentication_exception.dart';
import 'package:domain/exceptions/network_exceptions.dart';
import 'package:domain/exceptions/payment_exception.dart';
import 'package:domain/exceptions/basic_exception.dart';
import 'package:domain/util/logger.dart';

class RewardApiServiceImpl implements RewardApiService {
  ApiClient apiClient;

  RewardApiServiceImpl({required this.apiClient});

  @override
  Future<String> checkOutSubscription({required String userId, required String membershipType, required String interval}) async{
    try {
      Map<String, dynamic> data = {
        'userId': userId,
        'type': membershipType,
        'interval': interval
      };
      final response = await apiClient.post('payment/checkout-subscription', data: data);

      final String url = response['message'];

      return url;

    } on NetworkException catch (e) {
      throw PaymentException(e.message);
    }
  }

  @override
  Future<UserSubscriptionResponse?> getSubscriptionStatus() async{
    try {

      final response = await apiClient.get('membership/me');

      final String  rawResponse = response.toString();

      if(rawResponse.contains('An unexpected error occurred')){

        Logger.debug('User Subscription NOT FOUND');

        return null;
      }
      Logger.debug('API SERVICE IMPL: $response');
      return UserSubscriptionResponse.fromJson(response);

    } on NetworkException catch (e) {
      debugPrint('Network Error : ${e.message}');
      return null;
    }
    on AuthenticationException catch(e){
      debugPrint('Auth Error : ${e.message}');
      rethrow;
    } catch(e){
      debugPrint('Normal Error : ${e}');
      return null;
    }
  }

  @override
  Future<List<SubscriptionTypeResponse>> getSubscriptionType() async {
    try {

      final response = await apiClient.get('membership/type');

      final items = response['items'] as List<dynamic>;

      final subscriptions = items.map((json){
        return SubscriptionTypeResponse.fromJson(json);
      }).toList();

      return subscriptions;


    } on NetworkException catch (e) {
      throw BasicException(e.message);
    }

  }

  @override
  Future<void> cancelSubscription({required String subscriptionId}) async {

    try {
      Map<String, dynamic> data = {
        'reason': 'Want to Cancel'
      };
      final response = await apiClient.put('membership/$subscriptionId/cancel', data: data);


    } on NetworkException catch (e) {
      throw BasicException(e.message);
    }
  }

}