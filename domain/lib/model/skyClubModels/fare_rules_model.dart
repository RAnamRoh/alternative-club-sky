class FareRulesModel {
  final String tripSegment;
  final List<RefundPenaltyModel> refundPenalties;
  final List<ExchangePenaltyModel> exchangePenaltyList;

  FareRulesModel({
    required this.tripSegment,
    required this.refundPenalties,
    required this.exchangePenaltyList,
  });

  static FareRulesModel dummyModel = FareRulesModel(
    tripSegment: 'DAC - MLE',
    refundPenalties: [RefundPenaltyModel.dummyModel],
    exchangePenaltyList: [ExchangePenaltyModel.dummyModel],
  );

  static List<FareRulesModel> dummyList = [
    dummyModel,
    FareRulesModel(
      tripSegment: 'DAC - COX',
      refundPenalties: [RefundPenaltyModel.dummyModel],
      exchangePenaltyList: [ExchangePenaltyModel.dummyModel],
    ),
  ];
}

class ExchangePenaltyModel {
  final String applicability;
  final bool conditionsApply;
  final PenaltyModel penalty;

  ExchangePenaltyModel({
    required this.applicability,
    required this.conditionsApply,
    required this.penalty,
  });

  static ExchangePenaltyModel dummyModel = ExchangePenaltyModel(
    applicability: 'Before Departure',
    conditionsApply: true,
    penalty: PenaltyModel.dummyModel,
  );
}

class PenaltyModel {
  final String amount;
  final String currency;

  PenaltyModel({
    required this.amount,
    required this.currency,
  });

  static PenaltyModel dummyModel = PenaltyModel(
    amount: '50.00',
    currency: 'USD',
  );
}

class RefundPenaltyModel {
  final String applicability;
  final bool conditionsApply;
  final PenaltyModel penalty;
  final DateTime applicableFromDate;
  final DateTime applicableToDate;

  RefundPenaltyModel({
    required this.applicability,
    required this.conditionsApply,
    required this.penalty,
    required this.applicableFromDate,
    required this.applicableToDate,
  });


  static RefundPenaltyModel dummyModel = RefundPenaltyModel(
    applicability: 'BEFORE_DEPARTURE',
    conditionsApply: false,
    penalty: PenaltyModel.dummyModel,
    applicableFromDate: DateTime.utc(0001, 01, 01),
    applicableToDate: DateTime.utc(0001, 01, 01),
  );
}
