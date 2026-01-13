import 'package:domain/model/skyClubModels/passenger_info_model.dart';

class BaggageFareModel {
  List<PassengerInfoModel> passengers;
  String tripSegment;
  String paxType;
  String fareCode;
  String currency;
  double baseFare;
  double ticketFare;
  double totalFare;

  BaggageFareModel({
    required this.passengers,
    required this.tripSegment,
    required this.paxType,
    required this.fareCode,
    required this.currency,
    required this.baseFare,
    required this.ticketFare,
    required this.totalFare,
  });

  static BaggageFareModel dummy = BaggageFareModel(
    passengers: [
      PassengerInfoModel.dummy,
      PassengerInfoModel(
        name: "John Doe",
        ticketNumber: "XYZ2334",
        ssrCode: "XYZ23340000",
        paxType: 'XYZ2334',
        contact: "+1 123 456789",
        passportNo: "xyz123456789",
        bagAllowance: '30KG',
      ),
    ],
    tripSegment: 'DAC - MLE',
    paxType: 'XYZ2334',
    fareCode: 'Gbdmv3m',
    currency: 'AU \$',
    baseFare: 100.00,
    ticketFare: 200.00,
    totalFare: 300, // Added totalFare
  );

  static List<BaggageFareModel> dummyList = [
    BaggageFareModel.dummy,
    BaggageFareModel(
      passengers: [PassengerInfoModel.dummy],
      tripSegment: 'DAC - CAX',
      paxType: 'XYZ2334',
      fareCode: 'Gbdmv3m',
      currency: 'AU \$',
      baseFare: 200.00,
      ticketFare: 400.00,
      totalFare: 300, // Added totalFare
    )
  ];
}
