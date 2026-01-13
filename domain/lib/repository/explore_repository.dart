import 'package:domain/model/skyClubModels/offer_domain.dart';
import 'package:domain/model/skyClubModels/travelLocation.dart';

abstract class ExploreRepository {
  Future<List<TravelLocation>> getTravelLocationList();
  Future<List<OfferDomain>> getOfferList();
}