import 'package:data/remote/response/subscription/subscription_type_response.dart';
import 'package:domain/model/skyClubModels/subscription_type_domain.dart';

class SubscriptionTypeMapper {


  static SubscriptionTypeDomain fromResponse(SubscriptionTypeResponse response) {
    return SubscriptionTypeDomain(
      id: response.id,
      membershipType: response.membershipType,
      price: response.price,
      pointUnit: response.pointUnit,
      percentageDiscount: response.percentageDiscount,
      currency: response.currency,
      interval: response.interval,
      color: response.color,
      stripePriceId: response.stripePriceId,
      benefits: response.benefits.map((benefit) => benefit.toDomain()).toList(),
    );
  }


}