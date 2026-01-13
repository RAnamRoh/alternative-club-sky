
import 'package:data/remote/response/explore/offer_response.dart';
import 'package:data/remote/response/explore/top_destination_response.dart';

abstract class ExploreApiService {
  Future<List<TopDestinationResponse>> getTrendingDestinations();
  Future<List<OfferResponse>> getOffers();
}