class TravelItineraryModel {
  final String flightNumber;
  final String checkIn;
  final String from;
  final String to;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final String terminal;
  final String cabin;
  final String status;
  final String fleetInfo;


  TravelItineraryModel({
    required this.flightNumber,
    required this.checkIn,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.arrivalDate,
    required this.terminal,
    required this.cabin,
    required this.status,
    required this.fleetInfo,
  });

  static TravelItineraryModel dummy = TravelItineraryModel(
    flightNumber: 'AA123',
    checkIn: '',
    from: 'Dhaka(DAC)',
    to: 'MAle Valana Intl(MLE)',
    departureDate: DateTime.now(),
    arrivalDate: DateTime.now().add(Duration(days: 1)),
    terminal: '1',
    cabin: 'Economy',
    status: 'OK',
    fleetInfo: 'Boeing 373-800 Non Stop',
  );

  static List<TravelItineraryModel> dummyList = [
    TravelItineraryModel.dummy,
    TravelItineraryModel(
        flightNumber: 'AA124',
        checkIn: '',
        from: 'JFK',
        to: 'LHR',
        departureDate: DateTime.now(),
        arrivalDate: DateTime.now(),
        terminal: '2',
        cabin: 'Business',
        status: 'OK',
        fleetInfo: 'Airbus A320')
  ];


}
