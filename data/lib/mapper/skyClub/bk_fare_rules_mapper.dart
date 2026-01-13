import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:domain/model/skyClubModels/fare_rules_model.dart';

class BKFareRulesMapper {
  static FareRulesModel mapFromResponse(FareRule fareRule, BookingDetailsResponse response) {

    String tripSegment = '${response.flights.first.fromAirportCode} - ${response.flights.first.toAirportCode}';

    List<RefundPenaltyModel> refundPenaltyList = RefundPenalty.listToDomain(fareRule.refundPenalties);
    List<ExchangePenaltyModel> exchangePenaltyList = ExchangePenalty.listToDomain(fareRule.exchangePenalties);



    final model = FareRulesModel(
        tripSegment: tripSegment,
        refundPenalties: refundPenaltyList,
        exchangePenaltyList: exchangePenaltyList
    );

    return model;
  }

  static List<FareRulesModel> listFromResponse(List<FareRule> fareRules, BookingDetailsResponse response) {
    return fareRules.map((fareRule) => mapFromResponse(fareRule, response)).toList();
  }



}