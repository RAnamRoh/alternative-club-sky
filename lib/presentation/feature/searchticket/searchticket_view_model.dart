import 'package:domain/enum/ticket_filter.dart';
import 'package:domain/enum/travel_way.dart';
import 'package:domain/model/skyClubModels/airline.dart';
import 'package:domain/model/skyClubModels/flight_response_domain.dart';
import 'package:domain/model/skyClubModels/search_flight_details.dart';
import 'package:domain/model/skyClubModels/searched_flight_domain.dart';
import 'package:domain/repository/search_ticket_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:sky_club/presentation/base/base_viewmodel.dart';
import 'package:sky_club/presentation/feature/bookform/route/bookform_argument.dart';
import 'package:sky_club/presentation/feature/bookform/route/bookform_route.dart';
import 'package:sky_club/presentation/feature/searchticket/route/searchticket_argument.dart';
import 'package:sky_club/presentation/util/value_notifier_list.dart';

import 'package:data/remote/request/search_flight_ticket_request.dart';


class SearchticketViewModel extends BaseViewModel<SearchticketArgument> {
  final ValueNotifier<TravelWay> _selectedWay =
      ValueNotifier(TravelWay.roundTrip);

  late final SearchFlightDetails searchFlightDetails;

  ValueListenable<TravelWay> get selectedWay => _selectedWay;

  final SearchTicketRepository repository;

  ValueNotifierList<SearchedFlightDomain> ticketList = ValueNotifierList([]);
  ValueNotifierList<SearchedFlightDomain> filteredTicketList = ValueNotifierList([]);
  ValueNotifierList<AirlineDomain> airlineList = ValueNotifierList([]);

  ValueNotifier<TicketFilter?> selectedSortFilter = ValueNotifier<TicketFilter?>(null);
  ValueNotifierList<String> selectedAirlines = ValueNotifierList([]);
  ValueNotifierList<int> selectedStops = ValueNotifierList([]);

  SearchticketViewModel({required this.repository});

  @override
  void onViewReady({SearchticketArgument? argument}) {
    super.onViewReady();
    
    searchFlightDetails = argument!.flightDetails;
    fetchTickets();
  }

  void updateSelectedWay(TravelWay way) {
    _selectedWay.value = way;
  }

  Future<void> fetchTickets() async {
    try {
      final FlightResponseDomain? responseDomain =
      await loadData(() => repository.fetchTicketList(searchFlightDetails: searchFlightDetails));

      final List<SearchedFlightDomain>? tickets = responseDomain?.ticketList;

      final List<AirlineDomain>? airlines = responseDomain?.airportList;

      if (tickets != null && tickets.isNotEmpty) {
        filteredTicketList.value = tickets;
        ticketList.value = tickets;
      }

      if (airlines != null && airlines.isNotEmpty) {
        airlineList.value = airlines;
      }

    } catch (e) {
      print('Error fetching Tickets: $e');
      ticketList.clear();
      airlineList.clear();
    }
  }

  void bookNowClicked({required SearchedFlightDomain selectedFlight}) {
    navigateToScreen(
      destination: BookformRoute(
        arguments: BookformArgument(flightDetails: searchFlightDetails, selectedFlight: selectedFlight ),
      ),
    );

   // SearchFlightTicketRequest request = searchFlightDetails.toSearchFlightTicketRequest();



    //repository.searchTicket(searchFlightDetails: searchFlightDetails);

  }

  void updateSortFilter(TicketFilter filter) {
    selectedSortFilter.value = filter;
  }

  void updateSelectedAirlines(List<String> airlines) {
    selectedAirlines.value = airlines;
  }

  void updateSelectedStops(List<int> stops) {
   selectedStops.value = stops;
  }

  Future<void> applyFilter() async {
    // Start with the original list of tickets
    List<SearchedFlightDomain> filteredTickets = List.from(ticketList.value);

    // Filter by selected airlines
    if (selectedAirlines.value.isNotEmpty) {
      filteredTickets = filteredTickets.where((ticket) {
        // Check if any segment in the ticket matches the selected airlines
        return ticket.journeys.any((journey) =>
            journey.segments.any((segment) =>
                selectedAirlines.value.contains(segment.airline.code)));
      }).toList();
    }

    // Filter by selected stops
    if (selectedStops.value.isNotEmpty) {
      filteredTickets = filteredTickets.where((ticket) {
        // Check if the number of stops matches any of the selected stops
        return selectedStops.value.contains(ticket.stops);
      }).toList();
    }

    // Apply sorting based on the selected sort filter
    if (selectedSortFilter.value != null) {
      filteredTickets = selectedSortFilter.value!.getFilteredFlights(filteredTickets);
    }

    // Update the filteredTicketList with the final results
    filteredTicketList.value = filteredTickets;
  }

  void resetFilters() {
    selectedSortFilter.value = null;
    selectedAirlines.value = [];
    selectedStops.value = [];
    filteredTicketList.value = ticketList.value; // Reset to the original list
  }


}
