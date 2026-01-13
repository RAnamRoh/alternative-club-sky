import 'package:data/remote/response/subscription/user_subscription_response.dart';
import 'package:domain/enum/subscription_bill.dart';
import 'package:domain/model/skyClubModels/subscription_state.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';
import 'package:domain/model/skyClubModels/user_subscription_domain.dart';

class UserSubscriptionMapper {

  static UserSubscriptionDomain fromUserSubscriptionResponse(UserSubscriptionResponse response){

    return UserSubscriptionDomain(
        id: response.id,
        membershipRef: response.membershipRef,
        type: response.type,
        isActive: response.isActive,
        paidDate: response.paidDate,
        endDate: response.endDate,
        paidAmount: response.paidAmount,
        point: response.point,
        comment: response.comment,
        isManual: response.isManual,
        userId: response.userId,
        user: mapSRUserToSDUser(response.user),
        coupon: mapSRCouponToSDCoupon(response.coupon),
        stripeSubscriptionId: response.stripeSubscriptionId,
        stripeStatus: response.stripeStatus,
        unitPointValue: response.unitPointValue,
        interval: response.interval
    );
    
  }

  static SDUser mapSRUserToSDUser(SRUser response){
    return SDUser(
      id: response.id,
      name: response.name,
      email: response.email,
      phoneNumber: response.phoneNumber,
      address: mapSRAddressToSDAddress(response.address),
    );
  }

  static SDAddress mapSRAddressToSDAddress(SRAddress response){
    return SDAddress(
      street: response.street ?? '',
      postalCode: response.postalCode ?? '',
      city: response.city ?? '',
    );
  }

  static SDCoupon mapSRCouponToSDCoupon(SRCoupon response){
    return SDCoupon(
      value: response.value,
    );
  }



}