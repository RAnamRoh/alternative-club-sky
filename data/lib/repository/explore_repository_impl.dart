
import 'package:data/mapper/skyClub/offer_mapper.dart';
import 'package:data/mapper/skyClub/top_destination_mapper.dart';
import 'package:data/remote/api_service/explore_api_service.dart';
import 'package:data/remote/response/explore/offer_response.dart';
import 'package:data/remote/response/explore/top_destination_response.dart';
import 'package:domain/model/skyClubModels/offer_domain.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';
import 'package:domain/repository/explore_repository.dart';

class ExploreRepositoryImpl implements ExploreRepository{

  final ExploreApiService apiService;

  ExploreRepositoryImpl({required this.apiService});


  @override
  Future<List<TravelLocation>> getTravelLocationList() async {

    final List<TopDestinationResponse> response = await apiService.getTrendingDestinations();

    final List<TravelLocation> travelLocations = TopDestinationMapper.topDestinationsListToTravelLocationsList(destinations: response);

    return travelLocations;
  }

  @override
  Future<List<OfferDomain>> getOfferList() async {

    final List<OfferResponse> response = await apiService.getOffers();

    final List<OfferDomain> offers = OfferMapper.offerResponseListToOfferDomainList(response);

    return offers;
  }

}