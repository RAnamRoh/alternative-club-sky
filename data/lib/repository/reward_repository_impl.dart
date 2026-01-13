import 'package:data/mapper/skyClub/subscription_type_mapper.dart';
import 'package:data/mapper/skyClub/user_sub_mapper.dart';
import 'package:data/remote/api_service/reward_api_service.dart';
import 'package:data/remote/response/subscription/subscription_type_response.dart';
import 'package:data/remote/response/subscription/user_subscription_response.dart';
import 'package:data/sessionManager/user_session_manager.dart';
import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/enum/subscription_level.dart';
import 'package:domain/model/skyClubModels/sky_user.dart';
import 'package:domain/model/skyClubModels/subscription_state.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:domain/model/skyClubModels/user_subscription_domain.dart';
import 'package:domain/repository/reward_repository.dart';
import 'package:domain/util/logger.dart';

import '../local/shared_preference/entity/subscription_shared_pref_entity.dart';

class RewardRepositoryImpl implements RewardRepository {
  final RewardApiService apiService;

  RewardRepositoryImpl({required this.apiService});

  // @override
  // Future<SubscriptionState> fetchSubscriptionState() async {
  //
  //   await Future.delayed(Duration(seconds: 2));
  //
  //   final entity = await SubscriptionSharedPrefEntity.defaultEntity
  //       .getFromSharedPref() as SubscriptionSharedPrefEntity?;
  //   var response = entity ?? SubscriptionSharedPrefEntity.defaultEntity;
  //
  //   final state = SubscriptionState(
  //     isSubscribed: response.isSubscribed,
  //     subscriptionLevel: response.subscriptionLevel,
  //     expiryDate: response.expiryDate,
  //     subscriptionDate: response.subscriptionDate,
  //     subscriptionBill: response.subscriptionBill,
  //   );
  //
  //
  //   return state;
  // }

  // @override
  // Future<void> updateSubscription({required SubscriptionState subscriptionState}) async {
  //
  //   await Future.delayed(Duration(seconds: 2));
  //
  //   final newState = SubscriptionSharedPrefEntity(
  //       isSubscribed: subscriptionState.isSubscribed,
  //       subscriptionLevel: subscriptionState.subscriptionLevel,
  //       expiryDate: subscriptionState.expiryDate,
  //       subscriptionDate: subscriptionState.subscriptionDate,
  //       subscriptionBill: subscriptionState.subscriptionBill
  //   );
  //
  //
  //
  //   await newState.saveToSharedPref();
  // }

  @override
  Future<String> makePayment({required String membershipType, required String interval}) async {

    final SkyUser? userId = UserSessionManager().getUser;

    if (userId != null) {
      final String originalString = await apiService.checkOutSubscription(userId: userId.sub, membershipType: membershipType, interval: interval);
     // String cleanedString = originalString.substring(1, originalString.length - 1);


      return originalString;
    }
    else {
      return '';
    }
  }

  @override
  Future<UserSubscriptionDomain?> getSubscriptionStatus() async{
    final UserSubscriptionResponse? response = await apiService.getSubscriptionStatus();

    if(response != null){
      Logger.debug('In RepoIMPL: $response');
      return UserSubscriptionMapper.fromUserSubscriptionResponse(response);
    }
    Logger.debug('User Subscription NOT FOUND');
    return null;
  }

  @override
  Future<List<SubscriptionTypeDomain>> getSubscriptionType() async{
    final List<SubscriptionTypeResponse> response = await apiService.getSubscriptionType();

    return response.map((e) => SubscriptionTypeMapper.fromResponse(e)).toList();

  }

  @override
  Future<void> cancelSubscription({required String subscriptionId}) async {
    await apiService.cancelSubscription(subscriptionId: subscriptionId);
  }




}
