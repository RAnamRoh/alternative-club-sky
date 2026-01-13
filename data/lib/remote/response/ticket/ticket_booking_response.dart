class TicketBookingResponse {
  String pnr;
  String bookingId;

  TicketBookingResponse({
    required this.pnr,
    required this.bookingId,
  });


  factory TicketBookingResponse.fromJson(Map<String, dynamic> json) {
    return TicketBookingResponse(
      pnr: json['pnr'],
      bookingId: json['bookingId'],
    );
  }



}
