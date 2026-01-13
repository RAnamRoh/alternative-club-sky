import 'package:data/mapper/skyClub/bk_passenger_info_mapper.dart';
import 'package:data/remote/response/booking/booking_detail_response.dart';
import 'package:domain/model/skyClubModels/baggage_fare_model.dart';
import 'package:domain/model/skyClubModels/passenger_info_model.dart';

class BKBaggageAndFareMapper {

  static BaggageFareModel mapSegmentToBaggageFare(BDSegment segment, BookingDetailsFare fare) {

    final List<PassengerInfoModel> passengers = BKPassengerInfoMapper.mapListBDPassengerToPassengerInfoModel(segment.passangers);
    final String tripSegment = '${segment.startLocationCode} - ${segment.endLocationCode}';
    final String paxType = segment.passangers.isNotEmpty ? segment.passangers.first.type : '';
    final String fareCode = segment.passangers.isNotEmpty ? segment.passangers.first.fareDetail.fareBasisCode : '';
    final String currency = fare.currencyCode;
    final double baseFare = 0;
    final double ticketFare = 0;
    final double totalFare = fare.total.toDouble();

   final model = BaggageFareModel(
        passengers: passengers,
        tripSegment: tripSegment,
        paxType: paxType,
        fareCode: fareCode,
        currency: currency,
        baseFare: baseFare,
        ticketFare: ticketFare,
        totalFare: totalFare
    );

   return model;

  }


  static List<BaggageFareModel> mapListBDsegmentToBaggageFareModel(List<BDSegment> segments, BookingDetailsFare fare) {
    return segments.map((segment) => mapSegmentToBaggageFare(segment, fare)).toList();
  }

}