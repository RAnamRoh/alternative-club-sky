
class PassengerInfoModel {

  final String name;
  final String ticketNumber;
  final String ssrCode;
  final String paxType;
  final String contact;
  final String passportNo;
  final String bagAllowance;

  PassengerInfoModel({
    required this.name,
    required this.ticketNumber,
    required this.ssrCode,
    required this.paxType,
    required this.contact,
    required this.passportNo,
    required this.bagAllowance
  });

  static PassengerInfoModel dummy = PassengerInfoModel(
    name: "Rakibul Anam",
    ticketNumber: "XYZ2334",
    ssrCode: "XYZ23340000",
    paxType: 'XYZ2334',
    contact: "+1 123 456789",
    passportNo: "xyz123456789",
    bagAllowance: '20KG'
  );

  static List<PassengerInfoModel> dummyList = [
    PassengerInfoModel(
      name: "Rakibul Anam",
      ticketNumber: "XYZ2334",
      ssrCode: "XYZ23340000",
      paxType: 'XYZ2334',
      contact: "+1 123 456789",
      passportNo: "xyz123456789",
      bagAllowance: '20KG'
    ),
    PassengerInfoModel(
      name: "John Doe",
      ticketNumber: "XYZ2334",
      ssrCode: "XYZ23340000",
      paxType: 'XYZ2334',
      contact: "+1 123 456789",
      passportNo: "xyz123456789",
      bagAllowance: '30KG'
    ),
  ];


}