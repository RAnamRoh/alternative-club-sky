import 'package:domain/model/skyClubModels/searched_flight_domain.dart';

enum TicketFilter {
  departureEarliest,
  departureLatest,
  arrivalEarliest,
  arrivalLatest,
  priceLowToHigh,
  priceHighToLow
}

extension TicketFilterExtension on TicketFilter {
  String get name {
    switch (this) {
      case TicketFilter.departureEarliest:
        return 'Departure Time (Earliest)';
      case TicketFilter.departureLatest:
        return 'Departure Time (Latest)';
      case TicketFilter.arrivalEarliest:
        return 'Arrival Time (Earliest)';
      case TicketFilter.arrivalLatest:
        return 'Arrival Time (Latest)';
      case TicketFilter.priceLowToHigh:
        return 'Price : Low to High';
      case TicketFilter.priceHighToLow:
        return 'Price : High to Low';
    }
  }


  List<SearchedFlightDomain> getFilteredFlights(List<SearchedFlightDomain> searchedFlights) {
    switch (this) {
      case TicketFilter.departureEarliest:
        searchedFlights.sort((a, b) => a.departureTime.millisecondsSinceEpoch.compareTo(b.departureTime.millisecondsSinceEpoch));
        break;
      case TicketFilter.departureLatest:
        searchedFlights.sort((a, b) => b.departureTime.millisecondsSinceEpoch.compareTo(a.departureTime.millisecondsSinceEpoch));
        break;
      case TicketFilter.arrivalEarliest:
        searchedFlights.sort((a, b) => a.arrivalTime.millisecondsSinceEpoch.compareTo(b.arrivalTime.millisecondsSinceEpoch));
        break;
      case TicketFilter.arrivalLatest:
        searchedFlights.sort((a, b) => b.arrivalTime.millisecondsSinceEpoch.compareTo(a.arrivalTime.millisecondsSinceEpoch));
        break;
      case TicketFilter.priceLowToHigh:
        searchedFlights.sort((a, b) => a.pricePerPerson.compareTo(b.pricePerPerson));
        break;
      case TicketFilter.priceHighToLow:
        searchedFlights.sort((a, b) => b.pricePerPerson.compareTo(a.pricePerPerson));
        break;
    }
    return searchedFlights;
  }

}